//
//  UIView+.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import UIKit


extension UIView {
    
    /// Blur effect with default style `systemUltraThinMaterial`
    func addBlurEffect(_ style: UIBlurEffect.Style = .systemUltraThinMaterial) {
        var blur = UIVisualEffectView(frame: .zero)
        blur = UIVisualEffectView(effect: UIBlurEffect(style: style))
        blur.frame = self.bounds
        blur.isUserInteractionEnabled = false
        self.insertSubview(blur, at: 0)
    }
    
    func dropShadow() {
        layer.shadowRadius = 3
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3.0)
    }
    
    func removeShadow() {
        layer.shadowRadius = 0
        layer.shadowOpacity = 0
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0.0)
    }
    
}
