//
//  UIRouter.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import UIKit

final class UIRouter {
    
    //MARK: - Implementation
    public static var instance: UIRouter!
    
    /// - Common
    /// `alert` router. Contains different types of alert view controllers
    public lazy var alert: AlertUIRouter = {
        return AlertUIRouter()
    }()
    
    //MARK: - Init
    init(_ appDelegate: AppDelegate) {
        
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        window = appDelegate.window
        
        UIRouter.instance = self
    }
    
    //MARK: - Private Methods
    private var window: UIWindow!
    
    private var navigationController = UINavigationController()
    private var isNavigationBarHidden = true {
        didSet {
            isNavigationBarHiddenMethod()
        }
    }
    
    private let loginBoard = UIStoryboard(name: "Login", bundle: nil)
    private let mainBoard = UIStoryboard(name: "Main", bundle: nil)
}









//MARK: - Login Methods
extension UIRouter {
    
    public func loginViewController() {
        if let scene = UIApplication.shared.connectedScenes.first,
           let windowScene = (scene as? UIWindowScene) {
            let vc = LoginViewController.instantiate(from: loginBoard)
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.navigationBar.tintColor = #colorLiteral(red: 0.1762075126, green: 0.1275481284, blue: 0.5469389558, alpha: 1) 
            self.navigationController = navigationController
            window.windowScene = windowScene
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
    public func isNavigationBarHidden(_ statement: Bool = true) {
        isNavigationBarHidden = statement
    }
    
}

//MARK: - Main  Methods
extension UIRouter {
    
    public func tabbarController() {
        if let scene = UIApplication.shared.connectedScenes.first,
           let windowScene = (scene as? UIWindowScene) {
            let tabbar = TabBarViewController()
            let navigationController = UINavigationController(rootViewController: tabbar)
            navigationController.navigationBar.tintColor = Colors.shared.violet
            self.navigationController = navigationController
            window.windowScene = windowScene
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
}


//MARK: - Private Methods
private extension UIRouter {
    
    func isNavigationBarHiddenMethod() {
        navigationController.navigationItem.setHidesBackButton(isNavigationBarHidden, animated: true)
        navigationController.setNavigationBarHidden(isNavigationBarHidden, animated: true)
    }
    
}
