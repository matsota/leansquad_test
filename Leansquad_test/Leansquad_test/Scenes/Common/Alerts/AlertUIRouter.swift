//
//  AlertUIRouter.swift
//  Unionizer
//
//  Created by Andrew Matsota on 29.09.2020.
//

import UIKit

final class AlertUIRouter {
    
    //MARK: - Methods
    
    func `default`(from parent: UIViewController,
                   with localizedDescription: String,
                   onDidDismiss: (() -> Void)? = nil) {
        let configure = AlertConfigureStruct(defaultAlert: localizedDescription)
        let vc = AlertWithOK.instantiate(from: storyboard)
        
        vc.onDidDismiss = onDidDismiss
        vc.configure = configure
        
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        parent.present(vc, animated: true)
    }
    
    //MARK: - Init
    init () {
        storyboard = UIStoryboard(name: "Alerts", bundle: nil)
    }
    
    //MARK: - Private Implementation
    private let storyboard: UIStoryboard!
    
}

//MARK: - Confiure Alert
struct AlertConfigureStruct {
    let color: UIColor
    let alertTitle: String
    let alertBody: String
    
    init (defaultAlert body: String) {
        self.color = .darkGray
        self.alertTitle = "Attention"
        self.alertBody = body
    }
}
