//
//  ViewController.swift
//  Deal-Cards
//
//  Created by Andrew Porter on 12/13/19.
//  Copyright © 2019 Andrew Porter. All rights reserved.
//

import UIKit

class DealViewController: UIViewController {
    
    // MARK: - Outlets
    
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designDealButton()
    }
    
    // MARK: - Actions
    
    @IBAction func dealButtonPressed(_ sender: Any) {
        CardController.fetchCard { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self.fetchImageAndUpdateUI(for: card)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    // MARK: - Custom Methods
    
    func fetchImageAndUpdateUI(for card: Card) {
        CardController.fetchImage(for: card) { (result) in
            DispatchQueue.main.async {
                switch result {
                    case .success(let image):
                        self.cardLabel.text = card.value + " OF " + card.suit
                        self.cardImage = image
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func designDealButton() {
        buttonName.layer.borderWidth = 2
        buttonName.setTitle("Deal", for: .normal)
        buttonName.layer.cornerRadius = buttonName.frame.height / 2
    }
    
}

