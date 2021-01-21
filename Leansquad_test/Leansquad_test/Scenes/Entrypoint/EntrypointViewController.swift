//
//  EntrypointViewController.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import UIKit

class EntrypointViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome"
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = .systemFont(ofSize: 45, weight: .bold)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.initiateTransition() {
                UIRouter.instance.loginViewController()
            }
        }
    }


    //MARK: - Private Implementation
    
    /// - `Label`
    @IBOutlet private weak var welcomeLabel: UILabel!
}
