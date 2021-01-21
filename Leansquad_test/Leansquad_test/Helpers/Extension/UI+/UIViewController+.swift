//
//  UIViewController+.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import UIKit

extension UIViewController {
    
    /// - Transition animation
    func initiateTransition(completion: (() -> Void)? = nil) {
        let view = UIView()
        view.alpha = 0
        self.view.addSubview(view)
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        view.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.2).isActive = true
        view.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        UIView.animate(withDuration: 0.3) {
            view.alpha = 1
        } completion: { (_) in
            completion?()
        }
    }
    
    func transitionCompletion() {
        let view = UIView()
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        view.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.2).isActive = true
        view.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        UIView.animate(withDuration: 0.7) {
            view.alpha = 0
        } completion: { (_) in
            view.removeFromSuperview()
        }
    }
    
}
