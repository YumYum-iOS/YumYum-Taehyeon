//
//  PostCVC.swift
//  InstagramProfileLayout
//
//  Created by taehy.k on 2021/06/15.
//

import UIKit

class PostCVC: UICollectionViewCell {

    static let identifier = "PostCVC"
    
    var postImage = UIImageView()
    
    func setStatus(imageName: String) {
        if let image = UIImage(named: imageName) {
            postImage.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(postImage)
        
        postImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
