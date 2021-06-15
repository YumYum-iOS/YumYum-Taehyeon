//
//  ProfileViewController.swift
//  InstagramProfileLayout
//
//  Created by taehy.k on 2021/06/15.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties


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
        tableView.registerCell(type: ProfileAreaTVC.self)
    }
}


// MARK: - Table View Delegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 315
    }
    
}

// MARK: - Table View DataSource

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: ProfileAreaTVC.self, for: indexPath) as? ProfileAreaTVC else {
            return UITableViewCell()
        }
        
        return cell
    }
    
}
