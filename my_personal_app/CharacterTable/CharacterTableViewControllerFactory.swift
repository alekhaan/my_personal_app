//
//  CharacterTableViewControllerFactory.swift
//  my_personal_app
//
//  Created by AlexGod on 10.11.2023.
//

import Foundation

final class CharacterTableViewControllerFactory {
    
    func build() -> CharacterTableViewController {
        let service = CharacterService()
        let viewController = CharacterTableViewController(service: service)
        return viewController
    }
    
}
