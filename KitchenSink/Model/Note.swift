//
//  Note.swift
//  KitchenSink
//
//  Created by Bryan Bolivar on 30/07/20.
//  Copyright © 2020 Bryan Bolivar. All rights reserved.
//

import Foundation

enum Note: String {
    case Mi
    case Si
    case Sol
    case Re
    case La
    case MiGrave
    
    var soundURL: String? {
        return Bundle.main.path(forResource: self.rawValue, ofType: "m4a")
    }
    
    var name: String {
        switch self {
        case .MiGrave:
            return "Mi-"
        default:
            return self.rawValue
        }
    }
    
}
