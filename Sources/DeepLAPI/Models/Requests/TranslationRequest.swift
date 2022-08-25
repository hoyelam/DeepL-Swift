//
//  TranslationRequest.swift
//  
//
//  Created by Hoye Lam on 25/08/2022.
//

import Foundation

public struct TranslationRequest: Codable {

    
    public let text: String

    /// The source language of the given text,
    /// if nil DeepL will try to detect the language
    public let sourceLanguage: AvailableLanguage?
    
    /// The language on where `text` should be translated to
    public let targetLanguage: AvailableLanguage
    
    /// Sets whether the translation engine should first split the input into sentences.
    public let splitSentences: SplitSentencesOption
    
    ///Sets whether the translation engine should respect the original formatting, even if it would usually correct some aspects. Default is off
    public let perserveFormatter: Bool
    
    /// Sets whether the translated text should lean towards formal or informal language.
    public let formality: Formality
    
    public init(
        text: String,
        sourceLanguage: AvailableLanguage?,
        targetLanguage: AvailableLanguage,
        splitSentences: SplitSentencesOption = .normal,
        perserveFormatter: Bool = false,
        formality: Formality = .normal
    ) {
        self.text = text
        self.sourceLanguage = sourceLanguage
        self.targetLanguage = targetLanguage
        self.splitSentences = splitSentences
        self.perserveFormatter = perserveFormatter
        self.formality = formality
    }
    
    enum CodingKeys: String, CodingKey {
        case text
        case sourceLanguage = "source_lang"
        case targetLanguage = "target_lang"
        case splitSentences = "split_sentences"
        case perserveFormatter = "preserve_formatting"
        case formality
    }
}
