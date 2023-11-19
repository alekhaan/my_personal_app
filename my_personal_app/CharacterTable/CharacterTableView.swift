//
//  CharacterTableView.swift
//  my_personal_app
//
//  Created by AlexGod on 10.11.2023.
//

import Foundation
import UIKit

protocol CharacterTableViewDelegate {
    func didSelectRow(_ characterModel: CharacterDTO) -> Void
}


final class CharacterTableView: UIView {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBrown
        tableView.dataSource = tableManager
        tableView.delegate = tableManager
        return tableView
    }()
    
    private lazy var spinnerView = UIActivityIndicatorView(style: .large)
    private lazy var tableManager = CharacterTableManager()
    var delegate: CharacterTableViewDelegate?
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemCyan
        addSubviews()
        makeConstraints()
        spinnerView.startAnimating()
        tableManager.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: [CharacterDTO]) -> Void {
        tableManager.tableData = viewModel
        spinnerView.stopAnimating()
        tableView.reloadData()
    }
    
}

// MARK: - CharacterTableManagerDelegate

extension CharacterTableView: CharacterTableManagerDelegate {
    func didSelectRow(_ characterModel: CharacterDTO) {
        delegate?.didSelectRow(characterModel)
    }
}

// MARK: -Private

private extension CharacterTableView {
    
    func addSubviews() {
        [tableView, spinnerView].forEach {
            self.addSubview($0)
        }
    }
    
    func makeConstraints() {
        [tableView, spinnerView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            spinnerView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
        ])
    }
    
}
