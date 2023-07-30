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
    
    lazy var roundedWordView: RoundedViewWithColor = {
        let view = RoundedViewWithColor { [weak self] in
            self?.refreshWithRandomWord()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 20
        return tableView
    }()
    
    let words = [
            Word(name: "antelope chipmunk", definition: "small ground squirrel of western United States", partOfSpeech: "noun"),
            Word(name: "auricular artery", definition: "artery that supplies blood to the ear", partOfSpeech: "noun"),
            Word(name: "electric circuit", definition: "an electrical device that provides a path for electrical current to flow", partOfSpeech: "noun"),
            Word(name: "punic", definition: "of or relating to or characteristic of ancient Carthage or its people or their language", partOfSpeech: "adjective"),
            Word(name: "glib", definition: "artfully persuasive in speech", partOfSpeech: "adjective"),
            Word(name: "appetite", definition: "a feeling of craving something", partOfSpeech: "noun"),
            Word(name: "authoritatively", definition: "in an authoritative and magisterial manner", partOfSpeech: "adverb"),
            Word(name: "golf links", definition: "a golf course that is built on sandy ground near a shore", partOfSpeech: "noun"),
            Word(name: "unsay", definition: "take back what one has said", partOfSpeech: "verb"),
            Word(name: "unbarreled", definition: "not in a barrel", partOfSpeech: "adjective")
        ]

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
        setupTableView()
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
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: roundedWordView.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    // MARK: - Action
    
    func refreshWithRandomWord() {
        let randomWord = words.randomElement()
        if let randomWord = randomWord {
            if randomWord.name == roundedWordView.wordTitleLabel.text {
                refreshWithRandomWord()
            } else {
                roundedWordView.wordTitleLabel.text = randomWord.name
                roundedWordView.wordDefinitionLabel.text = randomWord.definition
                roundedWordView.partsOfSpeechLabel.text = randomWord.partOfSpeech
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = words[indexPath.row].name
        content.secondaryText = words[indexPath.row].definition
        cell.contentConfiguration = content
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
}

