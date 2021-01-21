//
//  AlertWithOK.swift
//  Unionizer
//
//  Created by Andrew Matsota on 29.09.2020.
//

import UIKit

final class AlertWithOK: UIViewController {
    
    //MARK: - Implementation
    public var onDidDismiss: (() -> Void)?
    public var configure: AlertConfigureStruct?

    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// - View
        alertView.clipsToBounds = true
        alertView.backgroundColor = .clear
        
        /// - ImageView
        xMarkImageView.tintColor = configure?.color
        
        /// - Label
        titleLabel.text = configure?.alertTitle
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        bodyLabel.text = configure?.alertBody
        bodyLabel.font = UIFont.systemFont(ofSize: 24, weight: .thin)

        labelCollection.forEach { (label) in
            let dismissGesture = UITapGestureRecognizer(target: self, action: #selector(dismissByLabel(_:)))
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(dismissGesture)
            label.textColor = configure?.color
        }
        
        /// - Button
        dismissButton.addBlurEffect()
    }

    //MARK: - Private Actions
    @IBAction private func dismissAction(_ sender: Any) {
        dismiss(animated: true) {
            self.onDidDismiss?()
        }
    }
    
    //MARK: - Private Implementation
    
    /// - View
    @IBOutlet private weak var alertView: UIView!
    
    /// - ImageView
    @IBOutlet private weak var xMarkImageView: UIImageView!
    
    /// - Label
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    @IBOutlet private var labelCollection: [UILabel]!
    
    /// - Button
    @IBOutlet private weak var dismissButton: UIButton!
}









//MARK: - Protocoling
extension AlertWithOK: Storyboarded { }

//MARK: - Private Methods
private extension AlertWithOK {
    
    @objc func dismissByLabel(_ gestureRecognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
