//
//  JFCardSelectionCell.swift
//  JFCardSelectionViewController
//
//  Created by Jeremy Fox on 3/1/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit

class JFCardSelectionCell: UICollectionViewCell {

    static let reuseIdentifier = "JFCardSelectionCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    private weak var scrollView: UIScrollView!
    private var card: CardPresentable?
    private var rotation: CGFloat {
        guard let _scrollView = scrollView else { return 0 }
        guard let _superView = _scrollView.superview else { return 0 }
        let position = _superView.convertPoint(self.center, fromView: scrollView)
        let superViewCenterX = CGRectGetMidX(_superView.frame)
        return ((position.x - superViewCenterX) / superViewCenterX) / 1.5
    }
    private var centerY: CGFloat {
        let height = CGRectGetHeight(scrollView.frame)
        var y = rotation
        if rotation < 0.0 {
            y *= -1
            y *= (rotation * -1)
        } else {
            y *= rotation
        }
        return ((y * height) / 2) + (CGRectGetHeight(self.frame) / 1.5)
    }
    
    deinit {
        scrollView.removeObserver(self, forKeyPath: "contentOffset")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        scrollView.removeObserver(self, forKeyPath: "contentOffset")
        if let _imageURLString = card?.imageURLString {
            imageView.cancelImageLoadForImageURL(_imageURLString)
        }
        imageView.image = nil
        label.text = nil
    }
    
    func configureForCard(card: CardPresentable, inScrollView scrollView: UIScrollView) {
        
        self.card = card
        self.scrollView = scrollView
        self.scrollView.addObserver(self, forKeyPath: "contentOffset", options: .New, context: nil)
        
        imageView.loadImageAtURL(card.imageURLString, withDefaultImage: nil)
        
        self.transform = CGAffineTransformMakeRotation(rotation)
        center.y = centerY
        
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        shadow.shadowBlurRadius = 1
        shadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        let attributes: [String: AnyObject] = [
            NSShadowAttributeName: shadow
        ]
        label.attributedText = NSAttributedString(string: card.titleText, attributes: attributes)
    }
    
    private var previousContentOffsetX: CGFloat = 0
    private enum ScrollDirection {
        case None, Left, Right
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
//        if (card?.titleText ?? "") == "Avery Smith" {

        self.transform = CGAffineTransformMakeRotation(rotation)
        center.y = centerY
            
//        }
    }

}
