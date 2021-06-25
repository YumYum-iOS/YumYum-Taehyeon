//
//  TestVC.swift
//  CustomPopUp
//
//  Created by taehy.k on 2021/06/25.
//

import UIKit

// 커스텀 팝업이 있는 뷰 컨트롤러 클래스

class TestVC: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 액션 연결
        yesButton.addTarget(self, action: #selector(yesButtonClicked(_:)), for: .touchUpInside)
        noButton.addTarget(self, action: #selector(noButtonClicked(_:)), for: .touchUpInside)
        
        // ui 세팅
        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI() {
        alertView.layer.cornerRadius = 20
        yesButton.layer.cornerRadius = yesButton.frame.height / 2
        noButton.layer.cornerRadius = noButton.frame.height / 2
    }
    
    @objc func yesButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func noButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
