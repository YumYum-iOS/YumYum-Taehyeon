//
//  UIView + addSubview.swift
//  InstagramProfileLayout
//
//  Created by taehy.k on 2021/06/16.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews (_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
