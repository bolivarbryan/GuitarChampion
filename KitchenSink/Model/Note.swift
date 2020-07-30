//
//  Note.swift
//  KitchenSink
//
//  Created by Bryan Bolivar on 30/07/20.
//  Copyright © 2020 Bryan Bolivar. All rights reserved.
//

import Foundation

enum Note: String {
    case Mi = "Note 6"
    case Si = "Note 5"
    case Sol = "Note 4"
    case Re = "Note 3"
    case La = "Note 2"
    case MiGrave = "Note 1"
    
    var soundURL: String? {
        switch self {
        case .Mi:
            return Bundle.main.path(forResource: "Note 6", ofType: "m4a")
        case .Si:
            return Bundle.main.path(forResource: "Note 5", ofType: "m4a")
        case .Sol:
            return Bundle.main.path(forResource: "Note 4", ofType: "m4a")
        case .Re:
            return Bundle.main.path(forResource: "Note 3", ofType: "m4a")
        case .La:
            return Bundle.main.path(forResource: "Note 2", ofType: "m4a")
        case .MiGrave:
            return Bundle.main.path(forResource: "Note 1", ofType: "m4a")
        }
    }
}
