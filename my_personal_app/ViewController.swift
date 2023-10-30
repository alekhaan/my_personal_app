//
//  ViewController.swift
//  my_personal_app
//
//  Created by AlexGod on 08.10.2023.
//

import UIKit

final class ViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        charactersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = charactersData[indexPath.row]
        var cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        configuration.image = UIImage()
        configuration.text = character.name
        configuration.secondaryText = character.status + " " + character.species
        cell.contentConfiguration = configuration
        return cell
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemPink
        tableView.dataSource = self
        return tableView
    }()
    
    private var charactersData: [CharacterDTO] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let url: URL = URL(string: "https://rickandmortyapi.com/api/character")!
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard
                let data,
                error == nil
            else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let jsonData = try! decoder.decode(CharactersDTO.self, from: data)
            self.charactersData = jsonData.results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }).resume()
    
    }
    
}

struct CharacterDTO: Decodable {
    let name: String
    let status: String
    let species: String
    let image: URL
}

struct InformationDTO: Decodable {
    let count: Int
    let pages: Int
    let next: URL?
    let prev: URL?
}

struct CharactersDTO: Decodable {
    let info: InformationDTO
    let results: [CharacterDTO]
}
