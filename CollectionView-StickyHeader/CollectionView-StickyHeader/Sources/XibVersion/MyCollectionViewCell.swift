//
//  MyCollectionViewCell.swift
//  CollectionView-StickyHeader
//
//  Created by taehy.k on 2021/06/17.
//

import UIKit

import SnapKit
import Then

class MyCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "MyCollectionViewCell"
    
    lazy var commentLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 24)
        
        addSubview($0)
        $0.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
