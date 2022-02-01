//
//  WordStateData.swift
//  ContextFree
//
//  Created by Charles Diggins on 6/5/21.
//

import Foundation

public class WordStateData : Hashable, Equatable {
    var title: String = ""
    public func hash(into hasher: inout Hasher){
        hasher.combine(title)
    }
    
    var word = Word()
    var processedWord = ""  //this will show the current state of this word
    var processedSpanishWord = "psw"
    var processedFrenchWord = "pfw"
    var processedEnglishWord = "pew"
    
    var spanishContraction = "psw"
    var frenchContraction = "pfw"
    var englishContraction = "pew"
    
    //states
    var language = LanguageType.Spanish
    var tense = Tense.infinitive
    var person = Person.S1
    var number = Number.singular
    var gender = Gender.masculine
    
    //identity
    var wordType = ContextFreeSymbol.AMB
    var ambiguousType = AmbiguousType.general
    var adverbType = AdverbType.manner
    var articleType = ArticleType.definite
    var conjunctionType = ConjunctionType.coordinating
    var determinerType = DeterminerType.definite
    var adjectiveType = AdjectiveType.any
    var adjectivePosition = AdjectivePositionType.following
    var prepositionType = PrepositionType.general
    var personalPronounType = PronounType.PERSONAL  //ambiguous until set 
    var pronounType = PronounType.none
    var punctuationType = PunctuationType.none
    
    var nounType = NounType.any
    var nounSubjectivity = NounSubjectivity.either
    
    var verbModality = VerbModality.notModal
    var verbPassivity = VerbPassivity.active
    var verbPronominality = VerbPronomality.notPronominal
    var verbPreference = VerbPreference.any
    var verbTransitivity = VerbTransitivity.transitive
    var verbType = VerbType.normal
    var bescherelleInfo = ""
    
    public static func == (lhs: WordStateData, rhs: WordStateData) -> Bool {
        return lhs.word.word == rhs.word.word
    }
    
    public func getWordType()->ContextFreeSymbol{
        return wordType
    }
    
    public func getWordTypeString()->String{
        return wordType.rawValue
    }
    
    public func setProcessedWord(str: String){
        processedWord = str
    }
    
    public func setProcessedWord(language: LanguageType, str: String){
        switch language{
        case .Spanish:
            processedSpanishWord = str
        case .French:
            processedFrenchWord = str
        case .English:
            processedEnglishWord = str
        default:
            break
        }
     }
     
    public func getProcessedWord()->String{
        return processedWord
    }
    
    public func getProcessedWord(language: LanguageType)->String{
        switch language{
        case .Spanish:
            return processedSpanishWord
        case .French:
            return processedFrenchWord
        case .English:
            return processedEnglishWord
        default:
            return "NA"
        }
    }

}
