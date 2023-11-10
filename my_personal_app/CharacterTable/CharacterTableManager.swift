//
//  CharacterTableManager.swift
//  my_personal_app
//
//  Created by AlexGod on 10.11.2023.
//

import Foundation
import UIKit

final class CharacterTableManager: NSObject {
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
