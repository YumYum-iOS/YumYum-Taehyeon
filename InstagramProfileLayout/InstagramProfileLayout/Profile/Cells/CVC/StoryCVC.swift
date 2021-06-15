//
//  StoryCVC.swift
//  InstagramProfileLayout
//
//  Created by taehy.k on 2021/06/15.
//

import UIKit

class StoryCVC: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "StoryCVC"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var storyBackgroundView: UIView!
    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var storyNameLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

}

// MARK: - Helpers

extension StoryCVC {
    private func setupUI() {
        storyBackgroundView.applyCircleBorder(borderWidth: 1,
                                              borderColor: .frenchGray)
    }
    
    func setData(storyImageUrl: String, storyName: String) {
        if let image = UIImage(named: storyImageUrl) {
            self.storyImageView.image = image
        }
        
        storyNameLabel.text = storyName
    }
}
