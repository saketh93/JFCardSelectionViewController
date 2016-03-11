//
//  JFCardSelectionViewController+JFFocusedCardViewDelegate.swift
//  JFCardSelectionViewController
//
//  Created by Jeremy Fox on 3/11/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit

extension JFCardSelectionViewController: JFFocusedCardViewDelegate {
    
    func focusedCardViewDidSelectActionItemOne(focusedCardView: JFFocusedCardView) {
        guard let actionOne = focusedCardView.card.actionOne else { return }
        guard let indexPath = collectionView.indexPathsForSelectedItems()?.first else { return }
        delegate?.cardSelectionViewController(self, didSelectCardAction: actionOne, forCardAtIndexPath: indexPath)
    }
    
    func focusedCardViewDidSelectActionItemTwo(focusedCardView: JFFocusedCardView) {
        guard let actionTwo = focusedCardView.card.actionTwo else { return }
        guard let indexPath = collectionView.indexPathsForSelectedItems()?.first else { return }
        delegate?.cardSelectionViewController(self, didSelectCardAction: actionTwo, forCardAtIndexPath: indexPath)
    }
    
}