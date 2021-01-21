//
//  SetttingsViewController.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import UIKit
import SwiftKeychainWrapper

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        logoutLabel.text = "Log out"
        logoutLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        logoutLabel.numberOfLines = 0
        logoutLabel.minimumScaleFactor = 0.1
        logoutLabel.adjustsFontSizeToFitWidth = true
        logoutLabel.font = .systemFont(ofSize: 50, weight: .black)
        
        logoutLabel.isUserInteractionEnabled = true
        let logoutGesture = UITapGestureRecognizer(target: self, action: #selector(logoutAction(_:)))
        logoutLabel.addGestureRecognizer(logoutGesture)
    }
    
    
    //MARK: - Private Implementation
    @IBOutlet private weak var logoutLabel: UILabel!
    
}










//MARK: - Custom Protocols
extension SettingsViewController: Storyboarded { }

//MARK: - Private Methods
private extension SettingsViewController {
    
    @objc
    func logoutAction(_ gestureRecognizer: UITapGestureRecognizer) {
        KeychainWrapper.standard.remove(forKey: .token)
        KeychainWrapper.standard.remove(forKey: .uuid)
        UIRouter.instance.loginViewController()
    }
    
}
