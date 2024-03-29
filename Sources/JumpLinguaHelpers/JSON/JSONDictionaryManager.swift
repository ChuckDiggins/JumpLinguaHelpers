//
//  JSONstuff.swift
//  JSONstuff
//
//  Created by Charles Diggins on 9/14/21.
//

import Foundation


public struct JSONDictionaryManager {
    public var m_wsp : WordStringParser!
    
    public var jsonVerbManager = JsonVerbManager()
    public var jsonNounManager = JsonNounManager()
    public var jsonAdjectiveManager = JsonAdjectiveManager()
    public var jsonAdverbManager = JsonAdverbManager()
    public var jsonConjunctionManager = JsonConjunctionManager()
    public var jsonDeterminerManager = JsonDeterminerManager()
    public var jsonPrepositionManager = JsonPrepositionManager()
    public var jsonPronounManager = JsonPronounManager()
    public var bUseJsonStarterFiles = true
    public var verbModelManager = VerbModelManager()
    
    
    public init(){}
    
    public mutating func setWordStringParser(wsp: WordStringParser){
        m_wsp = wsp
    }
    
    public mutating func useJsonStarterFiles(useThem: Bool){
        bUseJsonStarterFiles = useThem
    }
    
    public mutating func loadJsonWords(){
        if bUseJsonStarterFiles {
            //jsonNounManager.encodeWords()  //this should wipe out existing jsonVerbs
            jsonNounManager.encodeInternalWords(collectionType: .Master, total: 2000)
            
            //jsonVerbManager.encodeVerbs()  //this should wipe out existing jsonVerbs
            jsonVerbManager.encodeInternalVerbs(collectionType: .Master, total: 2000)
            jsonAdjectiveManager.encodeInternalWords(collectionType: .Master, total: 2000)
            jsonPrepositionManager.encodeInternalWords(collectionType: .Master, total: 2000)
            jsonAdverbManager.encodeInternalWords(collectionType: .Master, total: 2000)
            jsonConjunctionManager.encodeInternalWords(total: 2000)
            jsonDeterminerManager.encodeInternalWords(total: 2000)
            jsonPronounManager.encodeInternalWords(total: 2000)
            
        }
        jsonVerbManager.decodeVerbs()
        createDictionaryFromJsonWords(wordType: .verb)
        
        jsonNounManager.decodeWords()
        createDictionaryFromJsonWords(wordType: .noun)
        
        jsonAdjectiveManager.decodeWords()
        createDictionaryFromJsonWords(wordType: .adjective)
        
        jsonPrepositionManager.decodeWords()
        createDictionaryFromJsonWords(wordType: .preposition)
        
        jsonDeterminerManager.decodeWords()
        createDictionaryFromJsonWords(wordType: .determiner)
        
        jsonAdverbManager.decodeWords()
        createDictionaryFromJsonWords(wordType: .adverb)
        
        jsonConjunctionManager.decodeWords()
        createDictionaryFromJsonWords(wordType: .conjunction)
        
        jsonPronounManager.decodeWords()
        createDictionaryFromJsonWords(wordType: .pronoun)
        
        
    }
    
    
    
    public func getExistingWord(jsonWord: JSONWord)->Word{
        let word = jsonWord.getWord()
        return m_wsp.findWordInDictionary(word: word)
    }
    
    
    public mutating func createDictionaryFromJsonWords(wordType: WordType){
        switch wordType{
        case .adjective:
            for i in 0 ..< jsonAdjectiveManager.getWordCount() {
                let jsonWord = jsonAdjectiveManager.getWordAt(index: i)
                createAndAppendAdjectiveFromJsonAdjective(jn: jsonWord)
            }
        case .adverb:
            for i in 0 ..< jsonAdverbManager.getWordCount() {
                let jsonWord = jsonAdverbManager.getWordAt(index: i)
                createAndAppendAdverbFromJsonAdverb(jn: jsonWord)
            }
        case .conjunction:
            for i in 0 ..< jsonConjunctionManager.getWordCount() {
                let jsonWord = jsonConjunctionManager.getWordAt(index: i)
                createAndAppendConjunctionFromJsonConjunction(jn: jsonWord)
            }
        case .determiner:
            for i in 0 ..< jsonDeterminerManager.getWordCount() {
                let jsonWord = jsonDeterminerManager.getWordAt(index: i)
                createAndAppendDeterminerFromJsonDeterminer(jn: jsonWord)
            }
        case .noun:
            for i in 0 ..< jsonNounManager.getWordCount() {
                let jsonWord = jsonNounManager.getWordAt(index: i)
                createAndAppendNounFromJsonNoun(jn: jsonWord)
            }
        case .preposition:
            for i in 0 ..< jsonPrepositionManager.getWordCount() {
                let jsonWord = jsonPrepositionManager.getWordAt(index: i)
                createAndAppendPrepositionFromJsonPreposition(jn: jsonWord)
            }
        case .pronoun:
            for i in 0 ..< jsonPronounManager.getWordCount() {
                let jsonWord = jsonPronounManager.getWordAt(index: i)
                createAndAppendPronounFromJsonPronoun(jn: jsonWord)
            }
        case .verb:
            for i in 0 ..< jsonVerbManager.getVerbCount() {
                let jsonWord = jsonVerbManager.getVerbAt(index: i)
//                createAndAppendVerbFromJsonVerb(jv: jsonWord)
                appendVerbFromJsonVerb(jv: jsonWord)
            }
        default:
            break
        }
    }
    
    //    mutating func createAndAppendAgnosticWordFromJsonWord(jn: JSONWord){
    //        var wordType = WordType.ambiguous
    //        switch jn.wordType {
    //        case "noun": wordType = WordType.noun
    //        case "verb": wordType = WordType.verb
    //        case "adjective": wordType = WordType.adjective
    //        case "adverb": wordType = WordType.adverb
    //        case "preposition": wordType = WordType.preposition
    //        case "conjunction": wordType = WordType.conjunction
    //        default: break
    //        }
    //        let word = Word(word: jn.english, spanish: jn.spanish, french: jn.french, english: jn.english, wordType: wordType)
    //        m_wsp.addNounToDictionary(noun: noun)
    //    }
    
    public mutating func createAndAppendNounFromJsonNoun(jn: JsonNoun){
        let noun = Noun(jsonNoun: jn, language: .Agnostic)
        m_wsp.addNounToDictionary(noun: noun)
    }
    
    public mutating func createAndAppendAdjectiveFromJsonAdjective(jn: JsonAdjective){
        let adj = Adjective(jsonAdjective: jn, language: .Agnostic)
        m_wsp.addAdjectiveToDictionary(adj: adj)
    }
    
    public mutating func createAndAppendAdverbFromJsonAdverb(jn: JsonAdverb){
        let adv = Adverb(json: jn, language: .Agnostic)
        m_wsp.addAdverbToDictionary(wd: adv)
    }
    
    public mutating func createAndAppendPrepositionFromJsonPreposition(jn: JsonPreposition){
        let p = Preposition(json: jn, language: .Agnostic)
        m_wsp.addPrepositionToDictionary(wd: p)
        
    }
    
    public mutating func createAndAppendPronounFromJsonPronoun(jn: JsonPronoun){
        let p = Pronoun(json: jn, language: .Agnostic)
        m_wsp.addPronounToDictionary(wd: p)
        
    }
    
    public mutating func createAndAppendConjunctionFromJsonConjunction(jn: JsonConjunction){
        let wd = Conjunction(json: jn, language: .Agnostic)
        m_wsp.addConjuctionToDictionary(wd: wd)
        
    }
    
    public mutating func createAndAppendDeterminerFromJsonDeterminer(jn: JsonDeterminer){
        let p = Determiner(json: jn, language: .Agnostic)
        m_wsp.addDeterminerToDictionary(wd: p)
    }
    
    public mutating func createJsonNoun(noun: Noun){
        appendJsonNoun(jsonNoun: noun.createJsonNoun())
    }
    
    public mutating func appendJsonNoun(jsonNoun: JsonNoun){
        jsonNounManager.appendWord(verb: jsonNoun)
        createAndAppendNounFromJsonNoun(jn: jsonNoun)
    }
    
    public mutating func createJsonVerb(verb: Verb)->Int{
        return appendJsonVerb(jsonVerb: verb.createJsonVerb())
    }
    
    public mutating func appendJsonVerb(jsonVerb: JsonVerb)->Int{
        jsonVerbManager.appendVerb(verb: jsonVerb)
        createAndAppendVerbFromJsonVerb(jv: jsonVerb)
        jsonVerbManager.printVerbs()
        return jsonVerbManager.getVerbCount()
    }
    
    public mutating func createVerbDictionaryFromJsonVerbs(){
        for i in 0 ..< jsonVerbManager.getVerbCount() {
            let jsonVerb = jsonVerbManager.getVerbAt(index: i)
            createAndAppendVerbFromJsonVerb(jv: jsonVerb)
        }
    }
    
    public mutating func createAndAppendVerbFromJsonVerb(jv: JsonVerb){
        //var cfModelTemp = cfModel
        
        //determine if this is a legitimate verb in all three languages
        
        let spanishVerbStuff = verbModelManager.analyzeAndCreateBVerb_SPIFE(language: .Spanish, verbPhrase: jv.spanish)
        let frenchVerbStuff = verbModelManager.analyzeAndCreateBVerb_SPIFE(language: .French, verbPhrase: jv.french)
        let englishVerbStuff = verbModelManager.analyzeAndCreateBVerb_SPIFE(language: .English, verbPhrase: jv.english)
        if ( spanishVerbStuff.isValid && frenchVerbStuff.isValid && englishVerbStuff.isValid){
            let verb = Verb(jsonVerb: jv, language: .Agnostic)
            m_wsp.addVerbToDictionary(verb: verb)
        }
    }
    
    
    public func appendAgnosticWord(wordType: WordType, spanishWord : String, frenchWord : String, englishWord: String){
        
    }
    
    public func analyzeAgnosticWord(wordType: WordType, spanishWord : String, frenchWord : String, englishWord: String)->Bool {
        return true
    }
    
    public mutating func appendVerbFromJsonVerb(jv: JsonVerb){
        m_wsp.addVerbToDictionary(verb: Verb(jsonVerb: jv, language: .Agnostic))
    }
    
}

