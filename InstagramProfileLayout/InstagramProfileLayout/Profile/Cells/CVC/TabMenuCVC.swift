//
//  TabMenuCVC.swift
//  InstagramProfileLayout
//
//  Created by taehy.k on 2021/06/16.
//

import UIKit

import SnapKit
import Then

class TabMenuCVC: UICollectionViewCell {
    
    static let identifier = "TabMenuCVC"
    
    var tabIcon = UIImageView()
    
    func setStatus(imageName: String, isTouched: Bool) {
        if let image = UIImage(named: imageName) {
            tabIcon.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tabIcon)
        
        tabIcon.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
