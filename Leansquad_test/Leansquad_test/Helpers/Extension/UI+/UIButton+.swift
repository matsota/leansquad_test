//
//  UIButton+.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import UIKit

extension UIButton {
    
    @objc
    public func disable() {
        isUserInteractionEnabled = false
    }
    
    @objc
    public func enable() {
        isUserInteractionEnabled = true
    }
    
}
