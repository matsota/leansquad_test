//
//  LoginViewController.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import UIKit
import SwiftKeychainWrapper

class LoginViewController: UIViewController {

    //MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        transitionCompletion()
        UIRouter.instance.isNavigationBarHidden()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager = NetworkManager(networking: NetworkService())

        setupTextFields()
        setupFakeLabels()
        
        enterButton.disable()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIRouter.instance.isNavigationBarHidden(false)
    }
    
    //MARK: - Private Actions
    @IBAction private func enterAction(_ sender: MainButton) {
        initiateTransition {
            self.entryMethod()
        }
    }
    
    //MARK: - Private Implementation
    private var networkManager: NetworkManager?
    
    /// `TextField`
    @IBOutlet private weak var emailTextField: CasualTextField!
    @IBOutlet private weak var passwordTextField: CasualTextField!
    
    /// - `Button`
    @IBOutlet private weak var enterButton: MainButton!
    
    /// - `Label`
    @IBOutlet private var labels: [UILabel]!
}









//MARK: - Custom Protocols
extension LoginViewController: Storyboarded { }

//MARK: - UITextField Delegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.handleButtonActivation(textField)
        }
    }
    
    /// - `Private` methods in delegate
    private func handleButtonActivation(_ textField: UITextField) {
        guard passwordTextField.text?.trimmingCharacters(in: .whitespaces) != "",
              emailTextField.text?.trimmingCharacters(in: .whitespaces) != "" else {
            enterButton.disable()
            return
        }
        enterButton.enable()
    }
    
}

//MARK: - Private methods
private extension LoginViewController {
    
    /// - `TextField`
    func setupTextFields() {
        emailTextField.placeholder = "Your email"
        emailTextField.delegate = self
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.addSecurityButton()
            .placeholder = "Your password"
    }
    
    /// - `Label`
    func setupFakeLabels() {
        
        labels.forEach { (label) in
            label.font = .systemFont(ofSize: 20, weight: .semibold)
            label.textColor = Colors.shared.violet
            label.isUserInteractionEnabled = true
            
            let gesture = UITapGestureRecognizer(target: self, action: #selector(labelAction(_:)))
            label.addGestureRecognizer(gesture)
        }
    }
    
    @objc
    func labelAction(_ gestureRecognizer: UITapGestureRecognizer) {
        UIRouter.instance.alert.default(from: self, with: "This action is not ready yet")
    }
    
    ///
    func entryMethod() {
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespaces),
              email != "",
              let password = passwordTextField.text?.trimmingCharacters(in: .whitespaces),
              password != "" else {return}
        
        let model = LoginRequest(email: email, password: password,
                                 project_id: "58b3193b-9f15-4715-a1e3-2e88e375f62b")
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.networkManager?.login(request: model, success: { (result) in
                guard let token = result.access_token,
                      let uuid = result.user?.id else {
                    DispatchQueue.main.async {
                        UIRouter.instance.alert.default(from: self,
                                                        with: LocalError.unknown.localizedDescription)
                    }
                    return
                }
                
                
                KeychainWrapper.standard.set(token, forKey: KeychainWrapper.Key.token.rawValue)
                KeychainWrapper.standard.set(uuid, forKey: KeychainWrapper.Key.uuid.rawValue)
                DispatchQueue.main.async {
                    UIRouter.instance.tabbarController()
                }
            }, failure: { (localizedDescription) in
                DispatchQueue.main.async {
                    UIRouter.instance.alert.default(from: self, with: localizedDescription)
                }
            })
        }
    }
    
}
