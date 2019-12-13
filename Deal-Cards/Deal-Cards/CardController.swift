//
//  CardController.swift
//  Deal-Cards
//
//  Created by Kyle Jennings on 12/13/19.
//  Copyright © 2019 Andrew Porter. All rights reserved.
//

import UIKit

class CardController {
  static let shared = CardController()
  
  func createCard(dict: [String: Any]) -> Card {
    guard let imageURLString = dict[CardKeys.imageKey] as? String,
      let value = dict[CardKeys.valueKey] as? String,
      let suit = dict[CardKeys.suitKey] as? String,
      let imageURL = URL(string: imageURLString)
      else {return}
    
    var data: Data?
    do {
      data = try Data(contentsOf: imageURL)
    } catch {
      print(error.localizedDescription)
    }
    guard let imageData = data else {return}
    let image = UIImage(data: imageData)
    
    let card = Card(value: value, suit: suit, image: image)
    return card
  }
}

enum CardKeys {
  fileprivate static let imageKey = "image"
  fileprivate static let valueKey = "value"
  fileprivate static let suitKey = "suit"
}
