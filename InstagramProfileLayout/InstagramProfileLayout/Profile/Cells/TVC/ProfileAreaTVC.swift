//
//  ProfileAreaTVC.swift
//  InstagramProfileLayout
//
//  Created by taehy.k on 2021/06/15.
//

import UIKit

class ProfileAreaTVC: UITableViewCell {
    
    // MARK: - Properties
    
    private var dummyList: [StoryDataModel] = []

    // MARK: - IBOutlets
    
    @IBOutlet weak var profileBackgroundView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var PostsCountButton: UIButton!
    @IBOutlet weak var FollowersCountButton: UIButton!
    @IBOutlet weak var FollowingCountButton: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    
    // MARK: - Cell Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ProfileAreaTVC {
    
    private func setupView() {
        setupUI()
        setupCollectionView()
        appendDummyData()
    }
    
    private func setupUI() {
        /// 프로필 테두리
        profileBackgroundView.applyCircleBorder(borderWidth: 1.5,
                                                borderColor: .frenchGray)
        
        /// 프로필 편집 버튼 테두리
        editProfileButton.applyBorder(cornerRadius: 6,
                                      borderWidth: 1,
                                      borderColor: .tuna)
        
    }
    
    private func setupCollectionView() {
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        
        storyCollectionView.register(UINib(nibName: StoryCVC.identifier, bundle: nil),
                                     forCellWithReuseIdentifier: StoryCVC.identifier)
        
    }
    
    private func appendDummyData() {
        dummyList.append(contentsOf: [
            StoryDataModel(storyImage: "storyAddIcon", storyName: "New"),
            StoryDataModel(storyImage: "storyImage1", storyName: "Friends"),
            StoryDataModel(storyImage: "storyImage2", storyName: "Sport"),
            StoryDataModel(storyImage: "storyImage3", storyName: "Design"),
            StoryDataModel(storyImage: "storyImage1", storyName: "Friends"),
            StoryDataModel(storyImage: "storyImage2", storyName: "Sport"),
            StoryDataModel(storyImage: "storyImage3", storyName: "Design"),
        ])
    }
}

// MARK: - UICollectionViewDelegate

extension ProfileAreaTVC: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource

extension ProfileAreaTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: StoryCVC.identifier, for: indexPath) as? StoryCVC else {
            return UICollectionViewCell()
        }
        
        cell.setData(storyImageUrl: dummyList[indexPath.row].storyImage,
                     storyName: dummyList[indexPath.row].storyName)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProfileAreaTVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 64.0, height: 83.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 15, right: 14)
    }
}
