//
//  CharacterDTO.swift
//  my_personal_app
//
//  Created by AlexGod on 10.11.2023.
//

import Foundation

struct CharacterDTO: Decodable {
    let name: String
    let status: String
    let species: String
    let image: URL
}
