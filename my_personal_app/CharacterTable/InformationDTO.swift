//
//  InformationDTO.swift
//  my_personal_app
//
//  Created by AlexGod on 10.11.2023.
//

import Foundation

struct InformationDTO: Decodable {
    let count: Int
    let pages: Int
    let next: URL?
    let prev: URL?
}
