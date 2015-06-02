//
//  JLinearLayout.swift
//  Geographical-scenery
//
//  Created by Jason on 1/6/15.
//  Copyright (c) 2015 Shepherd. All rights reserved.
//

import UIKit
/// 自定义layout
class JLinearLayout: UICollectionViewFlowLayout {
    private let height : CGFloat = 181.0
    private let width : CGFloat = 246.0
    private let active_distance : CGFloat = 200.0
    private let zoom_factor : CGFloat = 0.3
    /// 纯代码开发调用该方法
    override init() {
        super.init()
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    /// 从storyboard加载走该方法
    override func awakeFromNib() {
        itemSize = CGSizeMake(width, height)
        scrollDirection = UICollectionViewScrollDirection.Horizontal
        sectionInset = UIEdgeInsetsMake(30.0, 12.0, 30.0, 32.0)
        minimumLineSpacing = 30
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        let arr = super.layoutAttributesForElementsInRect(rect) as! [UICollectionViewLayoutAttributes]
        var visibleRect = CGRect()
        visibleRect.origin = collectionView!.contentOffset
        visibleRect.size = collectionView!.bounds.size
        for attrs in arr {
            if CGRectIntersectsRect(attrs.frame, rect) {
                let distance : CGFloat = CGRectGetMidX(visibleRect) - attrs.center.x
                let normalizedDistance : CGFloat = distance / active_distance
                if abs(distance) < active_distance {
                    let zoom : CGFloat = 1 + zoom_factor * (1 - abs(normalizedDistance))
                    attrs.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0)
                    attrs.zIndex = 1
                }
            }
        }
        return arr
    }
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        var offsetAdjustment : CGFloat = CGFloat(MAXFLOAT)
        let horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(collectionView!.bounds) / 2.0)
        let targetRect = CGRectMake(proposedContentOffset.x, 0.0, collectionView!.bounds.size.width, collectionView!.bounds.size.height)
        let arrs = super.layoutAttributesForElementsInRect(targetRect) as! [UICollectionViewLayoutAttributes]
        for layoutAttributes in arrs {
            let itemHorizontalCenter = layoutAttributes.center.x
            if abs(itemHorizontalCenter - horizontalCenter) < abs(offsetAdjustment) {
                offsetAdjustment = itemHorizontalCenter - horizontalCenter
            }
        }
        return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y)
    }
}
