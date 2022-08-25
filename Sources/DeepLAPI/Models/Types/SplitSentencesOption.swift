//
//  SplitSentencesOption.swift
//  
//
//  Created by Hoye Lam on 25/08/2022.
//

import Foundation

public enum SplitSentencesOption: Codable {
    /// no splitting at all, whole input is treated as one sentence
    case none
    /// (default) - splits on punctuation and on newlines
    case normal
    ///  splits on punctuation only, ignoring newlines
    case noneWLines
    
    public var key: String {
        switch self {
        case .none:
            return "0"
        case .normal:
            return "1"
        case .noneWLines:
            return "nonewlines"
        }
    }
}
