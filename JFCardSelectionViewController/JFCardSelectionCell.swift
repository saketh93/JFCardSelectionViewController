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
    private weak var scrollView: UIScrollView?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        label.text = nil
    }
    
    deinit {
        scrollView?.removeObserver(self, forKeyPath: "contentOffset")
    }
    
    func configureForCard(card: CardPresentable, inScrollView scrollView: UIScrollView) {
        self.scrollView = scrollView
        self.scrollView?.addObserver(self, forKeyPath: "contentOffset", options: .New, context: nil)
        imageView.loadImageAtURL(card.imageURLString, withDefaultImage: nil)
        label.text = card.titleText
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        print("change: \(change)")
        guard let position = scrollView?.convertPoint(self.frame.origin, fromView: nil) else { return }
        print("position: \(position)")
    }

}
