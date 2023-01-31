//
//  File.swift
//  
//
//  Created by Hoye Lam on 25/08/2022.
//

import Foundation

enum DeepLAPIEndpoint {
    case translateText(request: TranslationRequest)
}

extension DeepLAPIEndpoint: Endpoint {
    var path: String {
        switch self {
        case .translateText:
            return "/v2/translate"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .translateText:
            return .post
        }
    }
    
    var header: [String: String]? {
        return [
            "Authorization": "DeepL-Auth-Key \(DeepLAPI.authToken)",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
    }
    
    var body: [String: String]? {
        return nil
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .translateText(let request):
            return [
                URLQueryItem(
                    name: TranslationRequest.CodingKeys.text.stringValue,
                    value: request.text
                ),
                URLQueryItem(
                    name: TranslationRequest.CodingKeys.sourceLanguage.stringValue,
                    value: request.sourceLanguage?.key
                ),
                URLQueryItem(
                    name: TranslationRequest.CodingKeys.targetLanguage.stringValue,
                    value: request.targetLanguage.key
                ),
                URLQueryItem(
                    name: TranslationRequest.CodingKeys.splitSentences.stringValue,
                    value: request.splitSentences.key
                ),
                URLQueryItem(
                    name: TranslationRequest.CodingKeys.perserveFormatter.stringValue,
                    value: request.perserveFormatter ? "1" : "0"
                ),
                URLQueryItem(
                    name: TranslationRequest.CodingKeys.formality.stringValue,
                    value: request.formality.key
                )
            ]
        }
    }
}
