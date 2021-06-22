//
//  PostViewController.swift
//  InstagramProfileLayout
//
//  Created by taehy.k on 2021/06/16.
//

import UIKit

import SnapKit
import Then

class PostViewController: UIViewController {
    
    // MARK: - UI Properties
    /// 탭 메뉴 영역
    var tabMenuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.backgroundColor = .white
        $0.isScrollEnabled = false
        $0.contentInset = .zero
        $0.collectionViewLayout = layout
    }
    
    /// 탭 인디케이터
    var tabIndicatorView = UIView().then {
        $0.backgroundColor = .black
    }
    
    /// 컨텐츠 영역
    var scrollView = UIScrollView(frame: .zero).then {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    var firstVC = GridViewController()
    var secondVC = TagsViewController()

    
    // MARK: - Properties
    var tabSelectedIndex: Int = 0
    var tabList = ["gridIcon", "tagsIcon"]
    
    var imgList = ["postImg1", "postImg2", "postImg3",
                   "postImg4", "postImg5", "postImg6",
                   "postImg7", "postImg8", "postImg9",
                   "postImg1", "postImg2", "postImg3",
                   "postImg4", "postImg5", "postImg6",
                   "postImg7", "postImg8", "postImg9",
                   "postImg4", "postImg5", "postImg6",]
    
    var contentHeight: CGFloat = 500
    var cellWidth: CGFloat = UIScreen.main.bounds.width * (124/375)

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setUI()
        setScrollView()
    }
    
    // MARK: - Helpers
    func setHeight() {
        let cellCount = imgList.count / 3
        self.contentHeight = 44 + 1 + cellWidth * CGFloat(cellCount)
    }
    
    private func setDelegate() {
        tabMenuCollectionView.delegate = self
        tabMenuCollectionView.dataSource = self
        tabMenuCollectionView.register(TabMenuCVC.self, forCellWithReuseIdentifier: TabMenuCVC.identifier)
    }
    
    private func setUI() {
        view.addSubviews(scrollView, tabMenuCollectionView, tabIndicatorView)
        
        tabMenuCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(tabMenuCollectionView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        tabIndicatorView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(tabMenuCollectionView.snp.bottom)
            $0.height.equalTo(1)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
        }
    }
    
    private func setScrollView() {
        scrollView.delegate = self
        scrollView.contentSize.width = self.view.frame.width * 2
        
    
        self.addChild(firstVC)
        firstVC.setData(imgList: imgList)
        firstVC.setHeight()
        guard let gridView = firstVC.view else { return }
        gridView.frame = CGRect(x: 0, y: 0,
                                width: self.scrollView.frame.width,
                                height: self.scrollView.frame.height)

        
        self.addChild(secondVC)
        guard let tagsView = secondVC.view else { return }
        tagsView.frame = CGRect(x: self.view.frame.width, y: 0,
                                width: self.scrollView.frame.width,
                                height: self.scrollView.frame.height)
        
        scrollView.addSubviews(gridView, tagsView)
    }
}

// MARK: - 컬렉션뷰 델리게이트

extension PostViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        tabSelectedIndex = indexPath.row
        
        print(indexPath)

        switch indexPath.row {
        case 0:
            scrollView.setContentOffset(CGPoint.zero, animated: true)
        case 1:
            scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width, y: 0), animated: true)
        default:
            break
        }
        
        tabMenuCollectionView.reloadData()
    }
    
}

extension PostViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellwidth = width * (186/375)
        
        
        return CGSize(width: cellwidth, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - 컬렉션뷰 데이터소스

extension PostViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabMenuCVC.identifier, for: indexPath) as? TabMenuCVC else {
            return UICollectionViewCell()
        }
        
        if indexPath.row != tabSelectedIndex {
            cell.setStatus(imageName: tabList[indexPath.row], isTouched: false)
        }
        else {
            cell.setStatus(imageName: tabList[indexPath.row], isTouched: true)
        }
    
        return cell
    }
}

extension PostViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / UIScreen.main.bounds.width)
        
        switch page {
        case 0:
            tabSelectedIndex = 0
        case 1:
            tabSelectedIndex = 1
        default:
            break
        }
       
        tabMenuCollectionView.reloadData()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let cellwidth = UIScreen.main.bounds.width * (186/375)

        tabIndicatorView.snp.updateConstraints {
            $0.leading.equalToSuperview().offset( (scrollView.contentOffset.x / UIScreen.main.bounds.width) * cellwidth)
        }
    }
}

