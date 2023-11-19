//
//  CharacterDetailsViewController.swift
//  my_personal_app
//
//  Created by AlexGod on 19.11.2023.
//

import UIKit

final class CharacterDetailsViewController: UIViewController {
    
    var characterModel: CharacterDTO?
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    private lazy var titleView: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var subtitleView: UILabel = {
        let view = UILabel()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        addSubview()
        makeConstraints()
        configure()
    }
    
    func addSubview() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(subtitleView)
    }
    
    func makeConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func configure() {
        titleView.text = characterModel?.name
        subtitleView.text = characterModel?.species
    }
    
}
