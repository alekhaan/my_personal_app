//
//  ViewController.swift
//  my_personal_app
//
//  Created by AlexGod on 08.10.2023.
//

import Foundation
import UIKit

final class CharacterTableViewController: UIViewController {
    
    private lazy var contentView: CharacterTableView = {
        let view = CharacterTableView()
        return view
    }()
    
    private let service: CharacterServicing
    
    init(service: CharacterServicing) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchCharacter {characters in
            DispatchQueue.main.async {
                self.contentView.configure(with: characters)
            }
        }
    }
    
}
