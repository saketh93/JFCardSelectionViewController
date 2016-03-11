//
//  JFCardSelectionViewController+CollectionView.swift
//  JFCardSelectionViewController
//
//  Created by Jeremy Fox on 3/11/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit

extension JFCardSelectionViewController: UICollectionViewDelegate {
    
    public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        guard indexPath != previouslySelectedIndexPath else {
            shake()
            return
        }
        guard let card = dataSource?.cardSelectionViewController(self, cardForItemAtIndexPath: indexPath) else {
            return
        }
        updateUIForCard(card, atIndexPath: indexPath)
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
            previouslySelectedIndexPath = indexPath
        }
    }
}
