//
//  TranslationResponse.swift
//  
//
//  Created by Hoye Lam on 25/08/2022.
//

import Foundation

public struct TranslationResponse: Codable {
    public let translations: [Translation]
}

public struct Translation: Codable {
    /// The language detected in the source text. It reflects the value of the source_lang parameter, when specified
    public let detectedSourceLanguage: String
    
    /// The translated text.
    public let text: String
    
    enum CodingKeys: String, CodingKey {
        case detectedSourceLanguage = "detected_source_language"
        case text
    }
}
