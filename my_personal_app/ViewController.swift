//
//  ViewController.swift
//  my_personal_app
//
//  Created by AlexGod on 08.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        var url: URL = URL(string: "https://rickandmortyapi.com/api/character")!
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard
                let data,
                error == nil
            else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            var model = try! decoder.decode(CharactersDTO.self, from: data)
            print(model)
        }).resume()
    
    }
    
}

struct CharactersDTO: Decodable {
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
    
    let info: InformationDTO
    let results: [CharacterDTO]
}
