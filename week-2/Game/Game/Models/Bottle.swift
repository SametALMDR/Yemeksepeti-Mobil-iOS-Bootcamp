//
//  Bottle.swift
//  Game
//
//  Created by Macbook on 2.07.2021.
//

import Foundation

enum BottleState: Int {
    case standing = 1
    case fellDown = 0
}

struct Bottle {
    var location: Double
    var delta: Double
    var state: BottleState = .standing
}
