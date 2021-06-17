//
//  ContainerCollectionViewCell.swift
//  CollectionView-StickyHeader
//
//  Created by taehy.k on 2021/06/17.
//

import UIKit

class ContainerCollectionViewCell: UICollectionViewCell {
    static let cellId = "ContainerCollectionViewCell"
    
    lazy var contentsLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 24)
        
        addSubview($0)
        $0.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
