//
//  MainButton.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import UIKit

final class MainButton: UIButton {
    
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
    override func enable() {
        super.enable()
        dropShadow()
        tintColor = .white
        backgroundColor = Colors.shared.violet
    }
    
    override func disable() {
        super.disable()
        removeShadow()
        tintColor = Colors.shared.violet.withAlphaComponent(0.5)
        backgroundColor = Colors.shared.backgroud
    }
    
}









//MARK: - Private methods
private extension MainButton {
    
    func defaultAppearance() {
        tintColor = .white
        layer.cornerRadius = 8
        backgroundColor = Colors.shared.violet
        titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
    }

}
