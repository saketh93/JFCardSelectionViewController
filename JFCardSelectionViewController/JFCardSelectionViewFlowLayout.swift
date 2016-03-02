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
        itemSize = CGSize(width: 100, height: 110)
        minimumInteritemSpacing = 1000
        sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
