//
//  TabBarViewController.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UIRouter.instance.isNavigationBarHidden()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionCompletion()
        
        UITabBar.appearance().tintColor = Colors.shared.violet
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)
        let some_1 = SomeViewController.instantiate(from: mainBoard)
        let firstTab = UITabBarItem(title: "Projects", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        some_1.tabBarItem = firstTab
        
        let some_2 = SomeViewController.instantiate(from: mainBoard)
        let second = UITabBarItem(title: "Home", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        some_2.tabBarItem = second
        
        let settings = SettingsViewController.instantiate(from: mainBoard)
        let third = UITabBarItem(title: "Settings", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        settings.tabBarItem = third
        
        viewControllers = [some_1,some_2,settings]
        selectedIndex = 1
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIRouter.instance.isNavigationBarHidden(false)
    }
    
}
