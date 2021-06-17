//
//  InstagramLayoutViewController.swift
//  CollectionView-StickyHeader
//
//  Created by taehy.k on 2021/06/17.
//

import UIKit

class InstagramLayoutViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    let stickyIndexPath = IndexPath(row: 2, section: 0)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(ContainerCollectionViewCell.self,
                                forCellWithReuseIdentifier: ContainerCollectionViewCell.cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        setupFlowLayout()
    }
    
    private func setupFlowLayout() {
        let layout = CustomLayout(stickyIndexPath: stickyIndexPath)
        collectionView.collectionViewLayout = layout
    }
}


extension InstagramLayoutViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContainerCollectionViewCell.cellId,
                                                            for: indexPath) as? ContainerCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        switch indexPath.row {
        case 0:
            cell.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.5803921569, blue: 0.5921568627, alpha: 1)
        case 1:
            cell.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.7725490196, blue: 0.5137254902, alpha: 1)
        case 2:
            cell.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.8941176471, blue: 0.431372549, alpha: 1)
            cell.contentsLabel.text = "커스텀 탭바 위치"
        case 3:
            cell.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        case 4:
            cell.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        case 5:
            cell.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        default:
            break
        }
        
        return cell
    }
}

extension InstagramLayoutViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        
        switch indexPath.row {
        case 0:
            return CGSize(width: width, height: 250)
        case 1:
            return CGSize(width: width, height: 150)
        case 2:
            return CGSize(width: width, height: 44)
        case 3:
            return CGSize(width: width, height: 2000)
        case 4:
            return CGSize(width: width, height: 500)
        case 5:
            return CGSize(width: width, height: 700)
        default:
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
