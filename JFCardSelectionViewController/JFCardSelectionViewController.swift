//
//  JFCardSelectionViewController.swift
//  JFCardSelectionViewController
//
//  Created by Jeremy Fox on 3/1/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit

public struct CardAction {
    public let title: String
    public let action: () -> Void
    
    public init(title: String, action: () -> Void) {
        self.title = title
        self.action = action
    }
}

public protocol CardPresentable {
    var imageURLString: String { get }
    var titleText: String { get }
    var detailText: String { get }
    var actions: [CardAction]? { get }
}

public protocol JFCardSelectionViewControllerDelegate {
    
}

public protocol JFCardSelectionViewControllerDataSource {
    func numberOfCardsForCardSelectionViewController(cardSelectionViewController: JFCardSelectionViewController) -> Int
    func cardSelectionViewController(cardSelectionViewController: JFCardSelectionViewController, cardForItemAtIndexPath indexPath: NSIndexPath) -> CardPresentable
}

public class JFCardSelectionViewController: UIViewController {
    
    /// This will be the UIImage behind a UIVisualEffects view that will be used to add a blur effect to the background.
    public var backgroundImage: UIImage?
    public var delegate: JFCardSelectionViewControllerDelegate?
    public var dataSource: JFCardSelectionViewControllerDataSource?
    
    private var bgImageView = UIImageView()
    private var focusedImageView = JFFocusedCardView.loadFromNib()
    private let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: JFCardSelectionViewFlowLayout())
    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .ExtraLight))
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        buildBGUI()
        buildCardSelectionUI()
        buildFocusedCardUI()
    }
    
    public func reloadData() {
        collectionView.reloadData()
    }
    
    private func buildBGUI() {
        guard let _backgroundImage = backgroundImage else { return }
        bgImageView.image = _backgroundImage
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.addSubview(blurEffectView)
        view.addSubview(bgImageView)
        let views = ["bgImageView": bgImageView, "blurEffectView": blurEffectView]
        for val in ["V", "H"] {
            view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("\(val):|[bgImageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
            bgImageView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("\(val):|[blurEffectView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        }
    }
    
    private func buildCardSelectionUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let bundle = NSBundle(forClass: JFCardSelectionCell.self)
        collectionView.registerNib(UINib(nibName: JFCardSelectionCell.reuseIdentifier, bundle: bundle), forCellWithReuseIdentifier: JFCardSelectionCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clearColor()
        view.addSubview(collectionView)
        let height = CGRectGetHeight(UIScreen.mainScreen().bounds) / 3
        let metrics = ["height": height]
        let views = ["collectionView": collectionView]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[collectionView(==height)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[collectionView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
    }
    
    private func buildFocusedCardUI() {
        focusedImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(focusedImageView)
        let views = ["focusedImageView": focusedImageView, "collectionView": collectionView]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(74)-[focusedImageView]-(40)-[collectionView]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(80)-[focusedImageView]-(80)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
    }
    
}

extension JFCardSelectionViewController: UICollectionViewDelegate {
    
}

extension JFCardSelectionViewController: UICollectionViewDataSource {
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let _dataSource = dataSource else { return 0 }
        return _dataSource.numberOfCardsForCardSelectionViewController(self)
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCellWithReuseIdentifier(JFCardSelectionCell.reuseIdentifier, forIndexPath: indexPath)
    }
    
    public func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        guard let cell = cell as? JFCardSelectionCell else { fatalError("Expected to display a `JFCardSelectionCell`.") }
        guard let _dataSource = dataSource else { return }
        let card = _dataSource.cardSelectionViewController(self, cardForItemAtIndexPath: indexPath)
        cell.configureForCard(card, inScrollView: collectionView)
        if (collectionView.indexPathsForSelectedItems()?.count ?? 0) == 0 && indexPath.section == 0 && indexPath.row == 0 {
            focusedImageView.configureForCard(card)
        }
    }
}
