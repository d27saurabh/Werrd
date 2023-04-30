//
//  RefreshButton.swift
//  Werrd
//
//  Created by Saurabh Deshpande on 4/29/23.
//

import UIKit

class RefreshButton: UIButton {
    
    var completion: (() -> Void)?
    
    init(completion: (() -> Void)?) {
        super.init(frame: .zero)
        self.completion = completion
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        tintColor = .white
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 40, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "arrow.clockwise.circle", withConfiguration: symbolConfiguration)
        setImage(image, for: .normal)
        
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        completion?()
    }

}
