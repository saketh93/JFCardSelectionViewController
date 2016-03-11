//
//  PointerLayer.swift
//  JFCardSelectionViewController
//
//  Created by Jeremy Fox on 3/10/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit

class PointerLayer: CALayer {
    
    override func drawInContext(ctx: CGContext) {
        
        contentsScale = UIScreen.mainScreen().scale
        let midX = CGRectGetMidX(frame)
        let midY = CGRectGetMidY(frame)
        
        CGContextMoveToPoint(ctx, midX, 16)
        CGContextAddLineToPoint(ctx, midX + 4, 20)
        CGContextAddLineToPoint(ctx, midX - 4, 20)
        CGContextAddLineToPoint(ctx, midX, 16)
        CGContextSetFillColorWithColor(ctx, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(ctx, 1)
        CGContextDrawPath(ctx, .Fill)
        
        CGContextMoveToPoint(ctx, midX, 10)
        CGContextAddLineToPoint(ctx, midX, midY)
        CGContextAddLineToPoint(ctx, midX - 1, midY)
        CGContextMoveToPoint(ctx, midX - 1, 10)
        CGContextSetFillColorWithColor(ctx, UIColor.blackColor().colorWithAlphaComponent(0.5).CGColor)
        CGContextSetLineWidth(ctx, 1)
        CGContextDrawPath(ctx, .Fill)
    }
    
}
