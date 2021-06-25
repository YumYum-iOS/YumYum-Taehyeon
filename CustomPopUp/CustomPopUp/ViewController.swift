//
//  ViewController.swift
//  CustomPopUp
//
//  Created by taehy.k on 2021/06/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func customPopupButtonClicked(_ sender: Any) {
        let vc = TestVC(nibName: "TestVC", bundle: nil)
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
}

