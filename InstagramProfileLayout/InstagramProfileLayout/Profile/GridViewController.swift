//
//  GridViewController.swift
//  InstagramProfileLayout
//
//  Created by taehy.k on 2021/06/16.
//

import UIKit

class GridViewController: UIViewController {
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        $0.backgroundColor = .white
        $0.isScrollEnabled = false
        $0.contentInset = .zero
        $0.collectionViewLayout = layout
    }
    
    var posts = [
        "postImg1", "postImg2", "postImg3",
        "postImg4", "postImg5", "postImg6",
        "postImg7", "postImg8", "postImg9",
        "postImg1", "postImg2", "postImg3",
        "postImg4", "postImg5", "postImg6",
        "postImg7", "postImg8", "postImg9",
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

    // MARK: - Helpers
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PostCVC.self, forCellWithReuseIdentifier: PostCVC.identifier)

    }

    private func setUI() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.left.right.height.equalToSuperview()
        }
    }
}


extension GridViewController: UICollectionViewDelegate {}

// MARK: - 컬렉션뷰 데이터소스

extension GridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCVC.identifier, for: indexPath) as? PostCVC else {
            return UICollectionViewCell()
        }
        
        cell.setStatus(imageName: posts[indexPath.row])
    
        return cell
    }
}

extension GridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellwidth = width * (124/375)
        
        return CGSize(width: cellwidth, height: cellwidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
