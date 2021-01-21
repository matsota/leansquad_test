//
//  CasualTextField.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import UIKit

final class CasualTextField: UITextField {
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultAppearance()
    }
    
    //MARK: - Override
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let boundsWithClear = super.editingRect(forBounds: bounds)
        return CGRect(x: 14,
                      y: 0,
                      width: boundsWithClear.width,
                      height: boundsWithClear.height)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let boundsWithClear = super.editingRect(forBounds: bounds)
        return CGRect(x: 14,
                      y: 0,
                      width: boundsWithClear.width,
                      height: boundsWithClear.height)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let boundsWithClear = super.editingRect(forBounds: bounds)
        return CGRect(x: 14,
                      y: 0,
                      width: boundsWithClear.width,
                      height: boundsWithClear.height)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.width - 25 - 14,
                      y: 0,
                      width: 25,
                      height: bounds.height)
    }
    
}









//MARK: - Public methods
extension CasualTextField {
    
    @discardableResult
    public func addSecurityButton() -> Self {
        let eyeButton = UIButton()
        eyeButton.addTarget(self, action: #selector(isSecurity(_:)), for: .touchUpInside)
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        eyeButton.tintColor = .placeholderText
        eyeButton.tag = Constants.securityButtonTag
        rightViewMode = .whileEditing
        rightView = eyeButton
        return self
    }
    
    
    
}

//MARK: - Private methods
private extension CasualTextField {
    
    func defaultAppearance() {
        borderStyle = .none
        layer.cornerRadius = 8
        backgroundColor = Colors.shared.backgroud
    }
    
    @objc
    func isSecurity(_ sender: UIButton) {
        if let eyeButton = viewWithTag(Constants.securityButtonTag) as? UIButton {
            isSecureTextEntry = !isSecureTextEntry
            switch isSecureTextEntry {
            case true:
                eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
                
            case false:
                eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            }
        }
    }
    
}

fileprivate struct Constants {
    static let securityButtonTag = 1234
}
