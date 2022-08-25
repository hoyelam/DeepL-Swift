//
//  Formality.swift
//  
//
//  Created by Hoye Lam on 25/08/2022.
//

import Foundation

public enum Formality: Codable {
    /// for a regular formal language
    case normal
    /// for a more formal language
    case more
    ///  for a more informal language
    case less
    
    var key: String {
        switch self {
        case .normal:
            return "default"
        case .more:
            return "more"
        case .less:
            return "less"
        }
    }
}
