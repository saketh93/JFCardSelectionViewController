//
//  JFCardSelectionViewFlowLayout.swift
//  JFCardSelectionViewController
//
//  Created by Jeremy Fox on 3/1/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit

class JFCardSelectionViewFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        scrollDirection = .Horizontal
        minimumLineSpacing = -10
        let w = CGRectGetWidth(UIScreen.mainScreen().bounds) / 4
        let h = CGRectGetHeight(UIScreen.mainScreen().bounds) / 6
        itemSize = CGSize(width: w, height: h)
        minimumInteritemSpacing = 1000
        let midX = CGRectGetMidX(UIScreen.mainScreen().bounds)
        let halfItemWidth = itemSize.width / 2
        let left = midX - halfItemWidth
        let right = left
        sectionInset = UIEdgeInsets(top: 0, left: left, bottom: 0, right: right)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
