//
//  JFFocusedCardView.swift
//  JFCardSelectionViewController
//
//  Created by Jeremy Fox on 3/1/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit

class JFFocusedCardView: UIView {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabelOne: UILabel!
    @IBOutlet var subTitleLabelTwo: UILabel!
    
    func configureForCard(card: CardPresentable) {
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 2
        imageView.loadImageAtURL(card.imageURLString, withDefaultImage: nil)
        
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        shadow.shadowBlurRadius = 1
        shadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        let attributes: [String: AnyObject] = [
            NSShadowAttributeName: shadow
        ]
        titleLabel.attributedText = NSAttributedString(string: card.titleText, attributes: attributes)
        subTitleLabelOne.attributedText = NSAttributedString(string: card.detailText, attributes: attributes)
    }

}

protocol UIViewLoading {}
extension UIView : UIViewLoading {}

extension UIViewLoading where Self : UIView {
    
    static func loadFromNib() -> Self {
        let nibName = "\(self)".characters.split{$0 == "."}.map(String.init).last!
        let bundle = NSBundle(forClass: Self.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiateWithOwner(self, options: nil).first as! Self
    }
    
}
