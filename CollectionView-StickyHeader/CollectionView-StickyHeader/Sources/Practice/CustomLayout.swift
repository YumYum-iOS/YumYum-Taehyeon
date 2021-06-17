//
//  CustomLayout.swift
//  CollectionView-StickyHeader
//
//  Created by taehy.k on 2021/06/17.
//

import UIKit

class CustomLayout: UICollectionViewFlowLayout {
    
    // MARK: - properties
    var stickyIndexPath: IndexPath? {
        didSet {
            invalidateLayout()
        }
    }
    
    // MARK: - init
    required init(stickyIndexPath: IndexPath?) {
        super.init()
        self.stickyIndexPath = stickyIndexPath
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - override func
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        if let stickyAttributes = getStickyAttributes(at: stickyIndexPath) {
            layoutAttributes?.append(stickyAttributes)
        }
        
        return layoutAttributes
    }
    
    // MARK: - private funcion
    private func getStickyAttributes(at indexPath: IndexPath?) -> UICollectionViewLayoutAttributes? {
        
        guard let collectionView = collectionView,
              let stickyIndexPath = indexPath,
              let stickyAttributes = layoutAttributesForItem(at: stickyIndexPath)?.copy()
        as? UICollectionViewLayoutAttributes else {
            return nil
        }
        
        if collectionView.contentOffset.y > stickyAttributes.frame.minY {
            var frame = stickyAttributes.frame
            frame.origin.y = collectionView.contentOffset.y
            stickyAttributes.frame = frame
            stickyAttributes.zIndex = 1
            return stickyAttributes
        }
        
        return nil
    }
}

