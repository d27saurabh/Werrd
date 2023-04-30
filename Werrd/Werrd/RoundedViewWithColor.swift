//
//  RoundedViewWithColor.swift
//  Werrd
//
//  Created by Riya Sinha on 4/29/23.
//

import Foundation
import UIKit

class RoundedViewWithColor: UIView {
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    let wordTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Programming"
        label.font = UIFont(name: "Rubik-Bold", size: 24)
        return label
    }()
    
    let partsOfSpeechLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "noun"
        label.font = UIFont(name: "Rubik-Italic", size: 14)
        return label
    }()
    
    let wordDefinationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "creating a sequence of instructions to enable the computer to do something"
        label.font = UIFont(name: "Rubik-Light", size: 18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let refreshButton: RefreshButton = {
        let button = RefreshButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - UI Setup Methods
    
    private func setupUI() {
        backgroundColor = UIColor(named: "WerddBlue")
        layer.cornerRadius = 20
        
        setupWordTitle()
        setupPartsOfSpeech()
        setupWordDefinition()
        setupRefreshButton()
    }
    
    
    func setupWordTitle() {
        addSubview(wordTitleLabel)
        NSLayoutConstraint.activate([
            wordTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            wordTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    func setupPartsOfSpeech() {
        addSubview(partsOfSpeechLabel)
        NSLayoutConstraint.activate([
            partsOfSpeechLabel.leadingAnchor.constraint(equalTo: wordTitleLabel.trailingAnchor, constant: 5),
            partsOfSpeechLabel.bottomAnchor.constraint(equalTo: wordTitleLabel.bottomAnchor, constant: -4),
            partsOfSpeechLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20)
        ])
    }
    
    func setupWordDefinition() {
        addSubview(wordDefinationLabel)
        NSLayoutConstraint.activate([
            wordDefinationLabel.topAnchor.constraint(equalTo: wordTitleLabel.bottomAnchor, constant: 10),
            wordDefinationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            wordDefinationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func setupRefreshButton() {
        addSubview(refreshButton)
        NSLayoutConstraint.activate([
            refreshButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            refreshButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
