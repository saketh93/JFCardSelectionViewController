//
//  CircularView.swift
//  JFCardSelectionViewController
//
//  Created by Jeremy Fox on 3/9/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit

class CircularView: UIView {

    private let sides = 110
    private var alphabet: [String] {
        return ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        let endAngle = CGFloat(2 * M_PI)
        let newRect = CGRect(x: CGRectGetMinX(rect) + 20, y: CGRectGetMinY(rect) + 20, width: CGRectGetWidth(rect) - 40, height: CGRectGetHeight(rect) - 40)
        let rad = CGRectGetWidth(newRect) / 2
        
        CGContextAddArc(ctx, CGRectGetMidX(rect), CGRectGetMidY(newRect), rad, 0, endAngle, 1)
        CGContextSetFillColorWithColor(ctx, UIColor.whiteColor().colorWithAlphaComponent(0.5).CGColor)
        CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().colorWithAlphaComponent(0.7).CGColor)
        CGContextSetLineWidth(ctx, 0.5)
        CGContextDrawPath(ctx, .FillStroke)
        
        secondMarkers(ctx, x: CGRectGetMidX(newRect), y: CGRectGetMidY(newRect), radius: rad, sides: sides, color: UIColor.whiteColor())
        
        drawText(newRect, ctx: ctx, radius: rad, color: UIColor.whiteColor())
    }
    
    private func degreeToRadian(a:CGFloat)->CGFloat {
        let b = CGFloat(M_PI) * a/180
        return b
    }
    
    
    private func circleCircumferencePoints(sides: Int, _ x: CGFloat, _ y: CGFloat, _ radius: CGFloat, adjustment: CGFloat=0) -> [CGPoint] {
        let angle = degreeToRadian(360/CGFloat(sides))
        let cx = x // x origin
        let cy = y // y origin
        let r  = radius // radius of circle
        var i = sides
        var points = [CGPoint]()
        while points.count <= sides {
            let xpo = cx - r * cos(angle * CGFloat(i) + degreeToRadian(adjustment))
            let ypo = cy - r * sin(angle * CGFloat(i) + degreeToRadian(adjustment))
            points.append(CGPoint(x: xpo, y: ypo))
            i--
        }
        return points
    }
    
    private func secondMarkers(ctx: CGContextRef, x: CGFloat, y: CGFloat, radius: CGFloat, sides: Int, color: UIColor) {
        let points = circleCircumferencePoints(sides, x, y, radius)
        let path = CGPathCreateMutable()
        let divider:CGFloat = 0.03
        for (_,p) in points.enumerate() {
            let xn = p.x + divider * (x - p.x)
            let yn = p.y + divider * (y - p.y)
            // build path
            CGPathMoveToPoint(path, nil, p.x, p.y)
            CGPathAddLineToPoint(path, nil, xn, yn)
            CGPathCloseSubpath(path)
            // add path to context
            CGContextAddPath(ctx, path)
        }
        let cgcolor = color.CGColor
        CGContextSetStrokeColorWithColor(ctx, cgcolor)
        CGContextSetLineWidth(ctx, 1)
        CGContextStrokePath(ctx)
    }
    
    private func drawText(rect: CGRect, ctx: CGContextRef, radius: CGFloat, color: UIColor) {
        // Flip text co-ordinate space, see: http://blog.spacemanlabs.com/2011/08/quick-tip-drawing-core-text-right-side-up/
        CGContextTranslateCTM(ctx, 0.0, CGRectGetHeight(rect))
        CGContextScaleCTM(ctx, 1.0, -1.0)
        // dictates how inset/outset the ring of labels will be
        let inset:CGFloat = 40
        // An adjustment to position labels correctly
        let points = circleCircumferencePoints(sides, CGRectGetMidX(rect), CGRectGetMidY(rect) - inset, radius + (inset / CGFloat(M_PI)), adjustment: 314)
        for (i,p) in points.enumerate() {
            guard i > 0 else { continue }
            guard i < alphabet.count + 1 else { return }
            let index = i - 1
            let aFont = UIFont.systemFontOfSize(7, weight: UIFontWeightLight)
            let attr: CFDictionaryRef = [NSFontAttributeName:aFont, NSForegroundColorAttributeName:UIColor.blackColor()]
            let text = CFAttributedStringCreate(nil, alphabet[index], attr)
            let line = CTLineCreateWithAttributedString(text)
            let bounds = CTLineGetBoundsWithOptions(line, CTLineBoundsOptions.UseOpticalBounds)
            CGContextSetLineWidth(ctx, 0.7)
            CGContextSetTextDrawingMode(ctx, .Fill)
            let xn = p.x - bounds.width / 2
            let yn = p.y - bounds.midY
            CGContextSetTextPosition(ctx, xn, yn)
            // the line of text is drawn - see https://developer.apple.com/library/ios/DOCUMENTATION/StringsTextFonts/Conceptual/CoreText_Programming/LayoutOperations/LayoutOperations.html
            // draw the line of text
            CTLineDraw(line, ctx)
            CGContextRotateCTM(ctx, 0.0)
        }
    }

}
