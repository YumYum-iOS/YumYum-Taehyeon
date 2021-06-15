//
//  UIView + Bordered.swift
//  InstagramProfileLayout
//
//  Created by taehy.k on 2021/06/15.
//

import UIKit

extension UIView {
    
    func applyCircleBorder(borderWidth: CGFloat = 1.0, borderColor: UIColor = .black) {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    func applyBorder(cornerRadius: CGFloat, borderWidth: CGFloat = 1.0, borderColor: UIColor = .black) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
}

