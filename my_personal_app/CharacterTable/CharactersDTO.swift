//
//  CharactersDTO.swift
//  my_personal_app
//
//  Created by AlexGod on 10.11.2023.
//

import Foundation

struct CharactersDTO: Decodable {
    let info: InformationDTO
    let results: [CharacterDTO]
}
