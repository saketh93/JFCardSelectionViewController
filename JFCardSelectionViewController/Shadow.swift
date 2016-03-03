//
//  Shadow.swift
//  JFCardSelectionViewController
//
//  Created by Jeremy Fox on 3/3/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit

struct Shadow {
    
    static var labelAttributesSoft: [String: AnyObject] {
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        shadow.shadowBlurRadius = 1
        shadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        return [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSShadowAttributeName: shadow
        ]
    }
    
    static var labelAttributesMedium: [String: AnyObject] {
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        shadow.shadowBlurRadius = 0.5
        shadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        return [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSShadowAttributeName: shadow
        ]
    }
    
    static var labelAttributesHard: [String: AnyObject] {
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        shadow.shadowBlurRadius = 1
        shadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(1)
        return [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSShadowAttributeName: shadow
        ]
    }
    
}
