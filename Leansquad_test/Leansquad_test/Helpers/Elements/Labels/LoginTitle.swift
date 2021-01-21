//
//  LoginTitle.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import UIKit

class LoginTitle: UILabel {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAppearance()
    }
    
}









//MARK: - Private methods
private extension LoginTitle {
    
    func setupAppearance() {
        self.numberOfLines = 0
        self.textColor = .black
        self.minimumScaleFactor = 0.1
        self.lineBreakMode = .byWordWrapping
        self.adjustsFontSizeToFitWidth = true
        self.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    
}
