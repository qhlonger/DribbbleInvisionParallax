//
//  CardFlowLayout.swift
//  DribbbleInvision
//
//  Created by pingguo on 2018/5/6.
//  Copyright © 2018年 hl. All rights reserved.
//

import UIKit

class CardFlowLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let targetContentOffset = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        
        guard  let collectionView = collectionView, let layoutAttributes = layoutAttributesForElements(in: collectionView.bounds) else {
            return targetContentOffset
        }
        
        let centerX = collectionView.bounds.width / 2.0
        let z = proposedContentOffset.x + centerX
        
        guard let first = layoutAttributes.sorted(by: { abs($0.center.x - z) < abs($1.center.x - z) }).first else {
            return targetContentOffset
        }
        
        return CGPoint(x: first.center.x - centerX, y: proposedContentOffset.y)
    }
}
