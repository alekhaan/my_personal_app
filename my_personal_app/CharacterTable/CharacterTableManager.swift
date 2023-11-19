//
//  CharacterTableManager.swift
//  my_personal_app
//
//  Created by AlexGod on 10.11.2023.
//

import Foundation
import UIKit

//MARK: - CharacterTableManagerDelegate

protocol CharacterTableManagerDelegate {
    func didSelectRow(_ characterModel: CharacterDTO) -> Void
}

final class CharacterTableManager: NSObject {
    var delegate: CharacterTableManagerDelegate?
    var tableData: [CharacterDTO] = []
}

// MARK: - UITableViewDataSource

extension CharacterTableManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = tableData[indexPath.row]
        var cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        configuration.image = UIImage()
        configuration.text = character.name
        configuration.secondaryText = character.status + " " + character.species
        cell.contentConfiguration = configuration
        return cell
    }
    
}

extension CharacterTableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let characterModel = tableData[indexPath.row]
        delegate?.didSelectRow(characterModel)
    }
}
