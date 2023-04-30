//
//  ViewController.swift
//  Werrd
//
//  Created by Saurabh Deshpande on 4/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Werrd."
        label.font = UIFont(name: "Rubik-SemiBold", size: 32)
        return label
    }()
    
    let roundedWordView: RoundedViewWithColor = {
        let view = RoundedViewWithColor(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Taupe")
        
        setupUI()
    }
    
    // MARK: - UI Setup
    
    func setupUI() {
        setupAppTitle()
        setupRoundedWordView()
    }
    
    func setupAppTitle() {
        view.addSubview(appTitleLabel)
        NSLayoutConstraint.activate([
            appTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            appTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            appTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupRoundedWordView() {
        view.addSubview(roundedWordView)
        NSLayoutConstraint.activate([
            roundedWordView.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor, constant: 30),
            roundedWordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            roundedWordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            roundedWordView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
}

