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
    var placeholderImage: UIImage? { get }
    var titleText: String { get }
    var detailText: String { get }
    var actionOne: CardAction? { get }
    var actionTwo: CardAction? { get }
}

public protocol JFCardSelectionViewControllerDelegate {
    
}

public enum JFCardSelectionViewSelectionAnimationStyle {
    case Fade, Slide
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
    public var selectionAnimationStyle: JFCardSelectionViewSelectionAnimationStyle = .Fade
    
    private var bgImageView = UIImageView()
    private var bgImageViewTwo = UIImageView()
    private var showingImageViewOne = true
    private var focusedView = JFFocusedCardView.loadFromNib()
    private var focusedViewHConstraints = [NSLayoutConstraint]()
    private var focusedViewTwo = JFFocusedCardView.loadFromNib()
    private var focusedViewTwoHConstraints = [NSLayoutConstraint]()
    private let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: JFCardSelectionViewFlowLayout())
    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
    private let blurEffectViewTwo = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
    private let bottomCircleView = UIView()
    private let bottomCircleOutlineView = UIView()
    private var previouslySelectedIndexPath: NSIndexPath?
    private let topSpace: CGFloat = 74
    private let bottomSpace: CGFloat = 20
    private let horizontalSpace: CGFloat = 80
    private var focusedViewMetrics: [String: CGFloat] {
        let width = CGRectGetWidth(view.frame) - (horizontalSpace * 2)
        return [
            "maxX": CGRectGetMaxX(view.frame),
            "minX": CGRectGetMinX(view.frame) - (width),
            "width": width,
            "topSpace": topSpace,
            "bottomSpace": bottomSpace,
            "horizontalSpace": horizontalSpace
        ]
    }
    private var focusedViewViews: [String: UIView] {
        return [
            "focusedView": focusedView,
            "focusedViewTwo": focusedViewTwo,
            "collectionView": collectionView
        ]
    }
    
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
        
        bgImageViewTwo.image = _backgroundImage
        bgImageViewTwo.translatesAutoresizingMaskIntoConstraints = false
        blurEffectViewTwo.translatesAutoresizingMaskIntoConstraints = false
        bgImageViewTwo.addSubview(blurEffectViewTwo)
        bgImageViewTwo.alpha = 0
        view.insertSubview(bgImageViewTwo, belowSubview: bgImageView)
        
        let views = ["bgImageView": bgImageView, "blurEffectView": blurEffectView, "bgImageViewTwo": bgImageViewTwo, "blurEffectViewTwo": blurEffectViewTwo]
        for val in ["V", "H"] {
            view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("\(val):|[bgImageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
            view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("\(val):|[bgImageViewTwo]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
            bgImageView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("\(val):|[blurEffectView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
            bgImageViewTwo.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("\(val):|[blurEffectViewTwo]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        }
        view.layoutIfNeeded()
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
        view.layoutIfNeeded()
    }
    
    private func buildFocusedCardUI() {
        focusedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(focusedView)
        focusedViewTwo.translatesAutoresizingMaskIntoConstraints = false
        focusedViewTwo.hidden = true
        view.insertSubview(focusedViewTwo, belowSubview: focusedView)
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(topSpace)-[focusedView]-(bottomSpace)-[collectionView]", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews))
        focusedViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(horizontalSpace)-[focusedView]-(horizontalSpace)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews)
        view.addConstraints(focusedViewHConstraints)
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(topSpace)-[focusedViewTwo]-(bottomSpace)-[collectionView]", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews))
        focusedViewTwoHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(maxX)-[focusedViewTwo]", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews)
        view.addConstraints(focusedViewTwoHConstraints)
        
        view.layoutIfNeeded()
        
        bottomCircleView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        view.insertSubview(bottomCircleView, belowSubview: collectionView)
        var height = CGRectGetWidth(view.frame)
        var y = CGRectGetMaxY(view.frame) - 44
        bottomCircleView.frame = CGRect(x: 0, y: y, width: height, height: height)
        bottomCircleView.makeRoundWithBorder(width: 0.5, color: UIColor.whiteColor().colorWithAlphaComponent(0.7))
        bottomCircleView.center.x = view.center.x
        
        bottomCircleOutlineView.backgroundColor = UIColor.clearColor()
        view.insertSubview(bottomCircleOutlineView, belowSubview: bottomCircleView)
        height += 40
        y -= 20
        bottomCircleOutlineView.frame = CGRect(x: 0, y: y, width: height, height: height)
        bottomCircleOutlineView.makeRoundWithBorder(width: 2, color: UIColor.whiteColor().colorWithAlphaComponent(0.5))
        bottomCircleOutlineView.center.x = view.center.x
        
        view.layoutIfNeeded()
    }
    
    private func updateUIForCard(card: CardPresentable) {
        if !showingImageViewOne {
            bgImageView.loadImageAtURL(card.imageURLString, withDefaultImage: card.placeholderImage)
            focusedView.configureForCard(card)
        } else {
            bgImageViewTwo.loadImageAtURL(card.imageURLString, withDefaultImage: card.placeholderImage)
            focusedViewTwo.configureForCard(card)
        }
        
        switch selectionAnimationStyle {
        case .Fade:
            fade()
        case .Slide:
            slide()
        }
        
        showingImageViewOne = !showingImageViewOne
    }
    
    private func fade() {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.bgImageView.alpha = (self.showingImageViewOne) ? 0 : 1
            self.focusedView.alpha = (self.showingImageViewOne) ? 0 : 1
            self.bgImageViewTwo.alpha = (self.showingImageViewOne) ? 1 : 0
            self.focusedViewTwo.alpha = (self.showingImageViewOne) ? 1 : 0
        }) { finished in
            if self.showingImageViewOne {
                self.bgImageViewTwo.image = nil
                self.focusedViewTwo.configureForCard(nil)
            } else {
                self.bgImageView.image = nil
                self.focusedView.configureForCard(nil)
            }
        }
    }
    
    private func slide() {
        var scrollLeft = true
        guard let indexPath = collectionView.indexPathsForSelectedItems()?.first else { return }
        if let _previousIndexPath = previouslySelectedIndexPath {
            scrollLeft = indexPath.row > _previousIndexPath.row
        }
        
        if showingImageViewOne {
            focusedViewTwo.hidden = true
            view.removeConstraints(focusedViewTwoHConstraints)
            if scrollLeft {
                focusedViewTwoHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(maxX)-[focusedViewTwo(==width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews)
            } else {
                focusedViewTwoHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(minX)-[focusedViewTwo(==width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews)
            }
            view.addConstraints(focusedViewTwoHConstraints)
            view.layoutIfNeeded() // Moves views into starting position
            focusedViewTwo.hidden = false
            
            view.removeConstraints(focusedViewHConstraints)
            view.removeConstraints(focusedViewTwoHConstraints)
            focusedViewTwoHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(horizontalSpace)-[focusedViewTwo]-(horizontalSpace)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews)
            if scrollLeft {
                focusedViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(minX)-[focusedView(==width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews)
            } else {
                focusedViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(maxX)-[focusedView(==width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews)
            }
            view.addConstraints(focusedViewHConstraints)
            view.addConstraints(focusedViewTwoHConstraints)
        } else {
            focusedView.hidden = true
            view.removeConstraints(focusedViewHConstraints)
            if scrollLeft {
                focusedViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(maxX)-[focusedView(==width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews)
            } else {
                focusedViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(minX)-[focusedView(==width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews)
            }
            view.addConstraints(focusedViewHConstraints)
            view.layoutIfNeeded() // Moves views into starting position
            focusedView.hidden = false
            
            view.removeConstraints(focusedViewHConstraints)
            view.removeConstraints(focusedViewTwoHConstraints)
            focusedViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(horizontalSpace)-[focusedView]-(horizontalSpace)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews)
            if scrollLeft {
                focusedViewTwoHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(minX)-[focusedViewTwo(==width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews)
            } else {
                focusedViewTwoHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(maxX)-[focusedViewTwo(==width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: focusedViewMetrics, views: focusedViewViews)
            }
            view.addConstraints(focusedViewHConstraints)
            view.addConstraints(focusedViewTwoHConstraints)
        }
        
        // Animates views into final position
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.6, options: .CurveEaseInOut, animations: { () -> Void in
            self.view.layoutIfNeeded()
            self.bgImageView.alpha    = CGFloat(!self.showingImageViewOne)
            self.bgImageViewTwo.alpha = CGFloat(self.showingImageViewOne)
        }) { finished in
            if self.showingImageViewOne {
                self.bgImageViewTwo.image = nil
                self.focusedViewTwo.configureForCard(nil)
            } else {
                self.bgImageView.image = nil
                self.focusedView.configureForCard(nil)
            }
        }
    }
    
}

extension JFCardSelectionViewController: UICollectionViewDelegate {
    
    public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        guard let _dataSource = dataSource else { return }
        let card = _dataSource.cardSelectionViewController(self, cardForItemAtIndexPath: indexPath)
        updateUIForCard(card)
        previouslySelectedIndexPath = indexPath
    }
    
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
        if (collectionView.indexPathsForSelectedItems()?.count ?? 0) == 0 && indexPath.section == 0 && indexPath.row == 0 && focusedView.card == nil {
            focusedView.configureForCard(card)
        }
    }
}
