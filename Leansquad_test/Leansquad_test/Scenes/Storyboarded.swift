//
//  Storyboarded.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import UIKit

protocol Storyboarded { }

extension Storyboarded where Self: UIViewController {

    static func instantiate(from storyboard: UIStoryboard) -> Self {
        let storyboardIdentifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
    
}
