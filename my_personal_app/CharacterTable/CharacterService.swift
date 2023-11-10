//
//  CharacterService.swift
//  my_personal_app
//
//  Created by AlexGod on 10.11.2023.
//

import Foundation

final class CharacterService {
    
    let decoder = JSONDecoder()
    let session: URLSession = {
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        return session
    }()
    
    func fetchCharacter(comletionHandler: @escaping ([CharacterDTO]) -> Void) {
        let url: URL = URL(string: "https://rickandmortyapi.com/api/character")!
        session.dataTask(with: url, completionHandler: { data, response, error in
            guard
                let data,
                error == nil
            else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let jsonData = try! decoder.decode(CharactersDTO.self, from: data)
            let charactersData = jsonData.results
            comletionHandler(charactersData)
        }).resume()
    }
    
}
