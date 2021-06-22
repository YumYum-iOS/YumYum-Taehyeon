//
//  ProfileViewController.swift
//  InstagramProfileLayout
//
//  Created by taehy.k on 2021/06/15.
//

import UIKit

import SnapKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    private var contentHeight: CGFloat = 500

    // MARK: IBOutlets
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Helpers

extension ProfileViewController {
    
    private func setupUI() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        tableView.registerCell(type: ProfileAreaTVC.self)
        tableView.registerCell(type: PostAreaTVC.self)
        
        tableView.tableFooterView = UIView()
    }
}


// MARK: - Table View Delegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return tableView.rowHeight
        } else {
            return self.contentHeight
        }
    }
}

// MARK: - Table View DataSource

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueCell(withType: ProfileAreaTVC.self, for: indexPath) as? ProfileAreaTVC else {
                return UITableViewCell()
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueCell(withType: PostAreaTVC.self, for: indexPath) as? PostAreaTVC else {
                return UITableViewCell()
            }
            
            cell.layoutIfNeeded()
            let postVC = PostViewController()
            self.addChild(postVC)
            cell.contentView.addSubview(postVC.view)
            
            postVC.setHeight()
            self.contentHeight = postVC.contentHeight

            postVC.view.snp.makeConstraints {
                $0.edges.equalTo(cell.snp.edges)
            }

            return cell
        default:
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            
        }
    }
}
