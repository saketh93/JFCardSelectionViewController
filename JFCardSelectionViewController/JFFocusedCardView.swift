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
    private var showingImageViewTwo = false
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabelOne: UILabel!
    @IBOutlet var subTitleLabelTwo: UILabel!
    @IBOutlet weak var actionOneButton: UIButton!
    @IBOutlet weak var actionTwoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewTwo.alpha = 0
        imageViewTwo.clipsToBounds = true
        imageViewTwo.layer.cornerRadius = 2
        imageViewTwo.layer.borderColor = UIColor.whiteColor().colorWithAlphaComponent(0.4).CGColor
        imageViewTwo.layer.borderWidth = 0.5
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
        
        if !showingImageViewTwo {
            imageView.loadImageAtURL(card.imageURLString, withDefaultImage: card.placeholderImage)
            presentImageViewOne()
        } else {
            imageViewTwo.loadImageAtURL(card.imageURLString, withDefaultImage: card.placeholderImage)
            presentImageViewTwo()
        }
        
        titleLabel.attributedText = NSAttributedString(string: card.titleText, attributes: Shadow.labelAttributesSoft)
        subTitleLabelOne.attributedText = NSAttributedString(string: card.detailText, attributes: Shadow.labelAttributesSoft)
        subTitleLabelTwo.attributedText = NSAttributedString(string: card.detailText, attributes: Shadow.labelAttributesSoft)
    }
    
    private func presentImageViewOne() {
        showingImageViewTwo = !showingImageViewTwo
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.imageView.alpha = 1
            self.imageViewTwo.alpha = 0
        }) { (finished) in
            self.imageViewTwo.image = nil
        }
    }
    
    private func presentImageViewTwo() {
        showingImageViewTwo = !showingImageViewTwo
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.imageView.alpha = 0
            self.imageViewTwo.alpha = 1
        }) { (finished) in
                self.imageView.image = nil
        }
    }

    @IBAction func actionOneButtonAction(sender: AnyObject) {
        self.card?.actionOne?.action()
    }
    
    @IBAction func actionTwoButtonAction(sender: AnyObject) {
        self.card?.actionTwo?.action()
    }
}


