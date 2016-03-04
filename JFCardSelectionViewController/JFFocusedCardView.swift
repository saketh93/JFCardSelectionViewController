//
//  JFFocusedCardView.swift
//  JFCardSelectionViewController
//
//  Created by Jeremy Fox on 3/1/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit

class JFFocusedCardView: UIView {

    var card: CardPresentable!
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
        imageView.layer.borderColor = UIColor.whiteColor().colorWithAlphaComponent(0.4).CGColor
        imageView.layer.borderWidth = 0.5
        actionOneButton.hidden = true
        actionOneButton.layer.cornerRadius = 2
        actionOneButton.layer.borderColor = UIColor.whiteColor().colorWithAlphaComponent(0.5).CGColor
        actionOneButton.layer.borderWidth = 0.5
        actionTwoButton.hidden = true
        actionTwoButton.layer.cornerRadius = 2
        actionTwoButton.layer.borderColor = UIColor.whiteColor().colorWithAlphaComponent(0.5).CGColor
        actionTwoButton.layer.borderWidth = 0.5
    }
    
    func configureForCard(card: CardPresentable?) {
        guard let _card = card else {
            self.card = nil
            self.imageView.image = nil
            self.titleLabel.text = nil
            self.subTitleLabelOne.text = nil
            self.subTitleLabelTwo.text = nil
            return
        }
        
        self.card = _card
        
        if let _actionOne = self.card.actionOne {
            let title = NSAttributedString(string: _actionOne.title, attributes: Shadow.labelAttributesMedium)
            actionOneButton.setAttributedTitle(title, forState: .Normal)
            actionOneButton.hidden = false
        }
        
        if let _actionTwo = self.card.actionTwo {
            let title = NSAttributedString(string: _actionTwo.title, attributes: Shadow.labelAttributesMedium)
            actionTwoButton.setAttributedTitle(title, forState: .Normal)
            actionTwoButton.hidden = false
        }
        

        imageView.loadImageAtURL(self.card.imageURLString, withDefaultImage: self.card.placeholderImage)
        
        titleLabel.attributedText = NSAttributedString(string: self.card.titleText, attributes: Shadow.labelAttributesSoft)
        subTitleLabelOne.attributedText = NSAttributedString(string: self.card.detailText, attributes: Shadow.labelAttributesSoft)
        subTitleLabelTwo.attributedText = NSAttributedString(string: self.card.detailText, attributes: Shadow.labelAttributesSoft)
    }

    @IBAction func actionOneButtonAction(sender: AnyObject) {
        self.card.actionOne?.action()
    }
    
    @IBAction func actionTwoButtonAction(sender: AnyObject) {
        self.card.actionTwo?.action()
    }
}


