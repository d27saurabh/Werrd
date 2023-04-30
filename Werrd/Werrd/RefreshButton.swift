//
//  RefreshButton.swift
//  Werrd
//
//  Created by Saurabh Deshpande on 4/29/23.
//

import UIKit

class RefreshButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    }

}
