//
//  JFFocusedCardView.swift
//  JFCardSelectionViewController
//
//  Created by Jeremy Fox on 3/1/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit

class JFFocusedCardView: UIView {

    var card: CardPresentable?
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabelOne: UILabel!
    @IBOutlet var subTitleLabelTwo: UILabel!
    @IBOutlet weak var actionOneButton: UIButton!
    @IBOutlet weak var actionTwoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 2
        actionOneButton.hidden = true
        actionTwoButton.hidden = true
    }
    
    func configureForCard(card: CardPresentable) {
        self.card = card
        
        if let _actionOne = card.actionOne {
            let title = NSAttributedString(string: _actionOne.title, attributes: Shadow.labelAttributesMedium)
            actionOneButton.setAttributedTitle(title, forState: .Normal)
            actionOneButton.hidden = false
        }
        
        if let _actionTwo = card.actionTwo {
            let title = NSAttributedString(string: _actionTwo.title, attributes: Shadow.labelAttributesMedium)
            actionTwoButton.setAttributedTitle(title, forState: .Normal)
            actionTwoButton.hidden = false
        }
        
        imageView.loadImageAtURL(card.imageURLString, withDefaultImage: card.placeholderImage)
        
        titleLabel.attributedText = NSAttributedString(string: card.titleText, attributes: Shadow.labelAttributesSoft)
        subTitleLabelOne.attributedText = NSAttributedString(string: card.detailText, attributes: Shadow.labelAttributesSoft)
        subTitleLabelTwo.attributedText = NSAttributedString(string: card.detailText, attributes: Shadow.labelAttributesSoft)
    }

    @IBAction func actionOneButtonAction(sender: AnyObject) {
        self.card?.actionOne?.action()
    }
    
    @IBAction func actionTwoButtonAction(sender: AnyObject) {
        self.card?.actionTwo?.action()
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
