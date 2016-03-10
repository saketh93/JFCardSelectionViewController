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
        CGContextMoveToPoint(ctx, midX, 16)
        CGContextAddLineToPoint(ctx, midX + 4, 20)
        CGContextAddLineToPoint(ctx, midX - 4, 20)
        CGContextAddLineToPoint(ctx, midX, 16)
        CGContextSetFillColorWithColor(ctx, UIColor.orangeColor().CGColor)
//        CGContextSetStrokeColorWithColor(ctx, UIColor.orangeColor().CGColor)
        CGContextSetLineWidth(ctx, 1)
        CGContextDrawPath(ctx, .Fill)
        
    }
    
}
