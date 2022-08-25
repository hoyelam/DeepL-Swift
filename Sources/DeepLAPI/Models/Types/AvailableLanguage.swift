//
//  AvailableLanguage.swift
//  
//
//  Created by Hoye Lam on 25/08/2022.
//

import Foundation

public enum AvailableLanguage: String, Codable {
    case bulgarian = "BG"
    case czech = "CS"
    case danish = "DA"
    case german = "DE"
    case greek = "EL"
    case english = "EN"
    case spanish = "ES"
    case estonian = "ET"
    case finnish = "FI"
    case french = "FR"
    case hungarian = "HU"
    case indonesian = "ID"
    case italian = "IT"
    case japanese = "JA"
    case lithuanian = "LT"
    case latvian = "LV"
    case dutch = "NL"
    case polish = "PL"
    case portuguese = "PT"
    case romanian = "RO"
    case russian = "RU"
    case slovak = "SK"
    case slovenian = "SL"
    case swedish = "SV"
    case turkish = "TR"
    case chinese = "ZH"

    var key: String {
        return self.rawValue
    }
}
