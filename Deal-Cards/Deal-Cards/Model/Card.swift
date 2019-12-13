//
//  Card.swift
//  Deal-Cards
//
//  Created by Anthony Torres on 12/13/19.
//  Copyright © 2019 Andrew Porter. All rights reserved.
//

import Foundation

struct TopLevelObject: Codable {
    let card: [Card]
}

struct Card: Codable {
    let suit: String
    let value: String
    let image: URL
}
