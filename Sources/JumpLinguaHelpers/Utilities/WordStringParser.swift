//
//  WordStringParser.swift
//  ContextFree
//
//  Created by Charles Diggins on 4/8/21.
//

import Foundation

public class WordStringParser {
    
    private var spanishWords = SpanishWords()
    private var frenchWords = FrenchWords()
    private var englishWords = EnglishWords()
    private var generalWords = GeneralWords()  //general purpose ... will replace spanish, french and english words
    private var m_language : LanguageType
    private var spanVerbModel : RomanceVerbModelConjugation
    private var frenchVerbModel : RomanceVerbModelConjugation
    private var englishVerbModel : EnglishVerbModelConjugation
    var wordCollectionManager = dWordCollectionManager()
    
    init(language: LanguageType, span: RomanceVerbModelConjugation, french: RomanceVerbModelConjugation, english : EnglishVerbModelConjugation){
        m_language = language
        spanVerbModel = span
        frenchVerbModel = french
        englishVerbModel = english
        //createDictionaries()
    }
    
    func getLanguage()->LanguageType{
        return m_language
    }
    
    func getGeneralWords()->GeneralWords{
        return generalWords
    }
    
    func getSpanishWords()->SpanishWords{
        return spanishWords
    }
    
    func getFrenchWords()->FrenchWords{
        return frenchWords
    }
    
    func getEnglishWords()->EnglishWords{
        return englishWords
    }
    
    func isNewVerb(verb: Verb)->Bool{
        for word in generalWords.verbList {
            if verb.word == word.word {
                return false
            }
        }
        return true
    }

    func getVerbList()->Array<Word>{
        return generalWords.verbList
    }
    
    func getVerbCount()->Int{
        return generalWords.verbList.count
    }
    
    func getWordCounts(){
        print("Adjective count = \(getWordCount(wordType: .adjective))")
        print("Adverb count = \(getWordCount(wordType: .adverb))")
        print("Determiner count = \(getWordCount(wordType: .determiner))")
        print("Conjunction count = \(getWordCount(wordType: .conjunction))")
        print("Noun count = \(getWordCount(wordType: .noun))")
        print("Preposition count = \(getWordCount(wordType: .preposition))")
        print("Pronoun count = \(getWordCount(wordType: .pronoun))")
        print("Verb count = \(getWordCount(wordType: .verb))")
    }
    
    func getWordCount(wordType: WordType)->Int{
        switch wordType{
        case .adjective: return generalWords.adjectiveList.count
        case .adverb: return generalWords.adverbList.count
        case .conjunction: return generalWords.conjunctionList.count
        case .determiner: return generalWords.determinerList.count
        case .noun: return generalWords.nounList.count
        case .preposition: return generalWords.prepositionList.count
        case .pronoun: return generalWords.pronounList.count
        case .verb: return generalWords.verbList.count
        default: return 0
        }
    }
    
    func getWordList(wordType: WordType)->Array<Word>{
        switch wordType{
        case .adjective: return generalWords.adjectiveList
        case .adverb: return generalWords.adverbList
        case .conjunction: return generalWords.conjunctionList
        case .determiner: return generalWords.determinerList
        case .noun: return generalWords.nounList
        case .preposition: return generalWords.prepositionList
        case .pronoun: return generalWords.pronounList
        case .verb: return generalWords.verbList
        default: return Array<Word>()
        }
    }
    
    func getWorkingList()->Array<Word>{
        return generalWords.workingList
    }
    
    func getWorkingListOfType(wordType: WordType)->Array<Word>{
        var wordTypeWordList = Array<Word>()
        for word in generalWords.workingList{
            if word.wordType == wordType {
                wordTypeWordList.append(word)
            }
        }
        return wordTypeWordList
    }
    
    func findWordInDictionary(word: Word)->Word{
        let wordList = getWordList(wordType: word.wordType)
        for w in wordList {
            if w == word {return w}
        }
        return Word()
    }
   

    func getNounList()->Array<Word>{
        return generalWords.nounList
    }
    
    func getNounCount()->Int{
        return generalWords.nounList.count
    }
    
    func getAdjectiveList()->Array<Word>{
        return generalWords.adjectiveList
    }
    
    func getAdjectiveCount()->Int{
        return generalWords.adjectiveList.count
    }
    
    func getDeterminerList()->Array<Word>{
        return generalWords.determinerList
    }
    
    func getDeterminerCount()->Int{
        return generalWords.determinerList.count
    }
    
    func getPrepositionCount()->Int{
        return generalWords.prepositionList.count
    }
    
    /*
    mutating func appendJsonVerbToDictionary()->Int{
        //romanceWords.verbList.append(verb)
        return romanceWords.verbList.count
    }
    */
    
    func getAgnosticWordFromDictionary(wordType:WordType, index:Int)->Word{
        switch wordType {
        case .determiner: return generalWords.determinerList[index]
        case .adjective: return generalWords.adjectiveList[index]
        case .adverb: return generalWords.adverbList[index]
        case .conjunction: return generalWords.conjunctionList[index]
        case .noun: return generalWords.nounList[index]
        case .verb: return generalWords.verbList[index]
        case .preposition: return generalWords.prepositionList[index]
        case .pronoun: return generalWords.pronounList[index]
        //case .punctuation: return generalWords.punctuationList[index]
        default: return Word()
        }
    }
    
    //create the correct verb on the fly
    func getVerbFromDictionary(language: LanguageType, index: Int)->Verb{
        var verb = Verb()
        switch language {
        case .Spanish:
            verb = generalWords.verbList[index] as! SpanishVerb
            let bv = BSpanishVerb(verbPhrase: verb.spanish)
            let verbModel = spanVerbModel.getVerbModel(verbWord: bv.m_verbWord)
            bv.setPatterns(verbModel : verbModel)
            verb.setBVerb(bVerb: bv)
        case .French:
            verb = generalWords.verbList[index] as! FrenchVerb
            let bv = BFrenchVerb(verbPhrase: verb.french)
            let verbModel = frenchVerbModel.getVerbModel(verbWord: bv.m_verbWord)
            bv.setPatterns(verbModel : verbModel)
            verb.setBVerb(bVerb: bv)
        case .English:
            verb = generalWords.verbList[index] as! EnglishVerb
            let brv = BEnglishVerb(verbPhrase : verb.english, separable: .separable)
            let verbModel = englishVerbModel.getVerbModel(verbWord: verb.english)
            brv.setModel(verbModel : verbModel)
            verb.setBVerb(bVerb: brv)
        default:
            break
        }
        return verb
    }
    
    //create the correct verb just in time
    func getNounFromDictionary(language: LanguageType, index: Int)->Noun{
        var noun  = Noun()
        switch language {
        case .Spanish:
            noun = generalWords.nounList[index] as! SpanishNoun
        case .French:
            noun = generalWords.nounList[index] as! FrenchNoun
        case .English:
            noun = generalWords.nounList[index] as! EnglishNoun
        default:
            break
        }
        return noun
    }
    
    //create the correct verb just in time
    func getAdjectiveFromDictionary(language: LanguageType, index: Int)->Adjective{
        var adj  = Adjective()
        switch language {
        case .Spanish:
            adj = generalWords.adjectiveList[index] as! SpanishAdjective
        case .French:
            adj = generalWords.adjectiveList[index] as! FrenchAdjective
        case .English:
            adj = generalWords.adjectiveList[index] as! EnglishAdjective
        default:
            break
        }
        return adj
    }
    
    //create the correct verb just in time
    func getPrepositionFromDictionary(language: LanguageType, index: Int)->Preposition{
        var prep  = Preposition()
        switch language {
        case .Spanish:
            prep = generalWords.prepositionList[index] as! SpanishPreposition
        case .French:
            prep = generalWords.prepositionList[index] as! FrenchPreposition
        case .English:
            prep = generalWords.prepositionList[index] as! EnglishPreposition
        default:
            break
        }
        return prep
    }
    
    //create the correct verb just in time
    func getDeterminerFromDictionary(language: LanguageType, index: Int)->Determiner{
        var det  = Determiner()
        switch language {
        case .Spanish:
            det = generalWords.determinerList[index] as! SpanishDeterminer
        case .French:
            det = generalWords.determinerList[index] as! FrenchDeterminer
        case .English:
            det = generalWords.determinerList[index] as! EnglishDeterminer
        default:
            break
        }
        return det
    }
    
    func addWordToWorkingDictionary(wd: Word){
        generalWords.workingList.append(wd)
    }
    
    func getCurrentWorkingWords()->Array<Word>{
        return generalWords.workingList
    }
    
    func addAdjectiveToDictionary(adj: Adjective){
        generalWords.adjectiveList.append(adj)
    }
    
    func addAdverbToDictionary(wd: Adverb){
        generalWords.adverbList.append(wd)
    }
    
    func addConjuctionToDictionary(wd: Conjunction){
        generalWords.conjunctionList.append(wd)
    }
    
    func addDeterminerToDictionary(wd: Determiner){
        generalWords.determinerList.append(wd)
    }
    
    func addNounToDictionary(noun: Noun){
        generalWords.nounList.append(noun)
    }
    
    func addPrepositionToDictionary(wd: Preposition){
        generalWords.prepositionList.append(wd)
    }
    
    func addPronounToDictionary(wd: Pronoun){
        generalWords.pronounList.append(wd)
    }
    
    func addVerbToDictionary(verb: Verb){
        generalWords.verbList.append(verb)
    }
    
    
    
    func convertWordToSentenceData(word: Word, wordType: ContextFreeSymbol)->SentenceData{
        var sentenceData = SentenceData()
        sentenceData.word = word
        sentenceData.data.wordType = wordType
        return sentenceData
    }

    func getPrepositions()->Array<Word>{
        switch(m_language){
        case .Spanish:
            return spanishWords.prepositionList
        case .French:
            return frenchWords.prepositionList
        default:
            return spanishWords.prepositionList
        }
    }
    
    func getConjunctions()->Array<Word>{
        switch(m_language){
        case .Spanish:
            return spanishWords.conjunctionList
        case .French:
            return frenchWords.conjunctionList
        default:
            return spanishWords.conjunctionList
        }
    }
    
    func handleObjectPronouns(wordString: String)->Array<String>{
        var wordList = Array<String>()
        var wsr = WordStringResolution()
        switch m_language {
        case .Spanish:
            let result = wsr.containsProgressiveAndAppendedObjectPronounSuffixes(word: wordString)
            //if is progressive, then replace the current word with the modified progressive (result.1)
            if result.0 {
                let newProgressive = result.1
                let indirectPronoun = result.2
                let directPronoun = result.3
                wordList.append(newProgressive)
                if indirectPronoun.count > 0 { wordList.append(indirectPronoun) }
                if directPronoun.count > 0 { wordList.append(directPronoun) }
                return wordList
            }
        default:
            return wordList
        }
        return wordList
    }



    func handleContractions(wordList: [Word])->[Word]{

        var wordListCopy = wordList
        switch m_language {
        case .Spanish:
            let sw = SpanishWords()
            var contractionFound  = true
            while contractionFound {
                for (i, word) in wordListCopy.enumerated() {
                    let result = sw.isContraction(word: word.word)
                    //if is contraction, then remove it and replace it
                    if result.0 {
                        wordListCopy.remove(at: i)
                        let word1 = Word(word: result.2, wordType : .unknown)
                        let word2 = Word(word: result.1, wordType : .unknown)
                        wordListCopy.insert(word2, at:i)
                        wordListCopy.insert(word1, at:i)
                        contractionFound = true
                        break
                    }
                    contractionFound = false
                }
            }
        default:
            return wordListCopy
        }
        return wordListCopy
    }
    
    //find one or more instances of the multi-word prepString in the wordList.  Replace them with a single multi-word string
    
    func handleCompoundExpressionInWordList( wordList: [Word], inputWordList: [String])->(Bool, [Word]){
        var startIndex = 0
        var wordIndex = 1
        var i = 0
        var wordListCopy = wordList
        let wordType = wordList[0].getWordType()
        var inputString = ""
        var compoundStringFound = false
        
        while  wordIndex > 0 {
            wordIndex = VerbUtilities().doesWordListContainSubstringList(inputWordList: wordListCopy, subStringList: inputWordList, startIndex : startIndex)
            //if phrase found, remove each word from the input wordListCopy and replace it with a single phrase string
            // for example, if the continguous words "a" "principios" "de" are found, then replace them with the multi-word phrase "a principios de"
            if ( wordIndex > 0 ){
                while i < inputWordList.count {
                    inputString += inputWordList[i] + " "
                    wordListCopy.remove(at:wordIndex)
                    i += 1
                }
                inputString = VerbUtilities().removeLeadingOrFollowingBlanks(characterArray: inputString)
                let inputWord = Word(word: inputString, wordType : wordType)
                wordListCopy.insert(inputWord, at: wordIndex)
                i=0
                inputString = ""
                compoundStringFound = true
            }
            startIndex = wordIndex + inputString.count  //jump startIndex past this "find" and look for another
        }
        if compoundStringFound { return (true, wordListCopy)}
        return (false, wordListCopy)
    }
    

    func handleCompoundExpressionInStringList( wordList: [String], inputWordList: [String])->(Bool, [String]){
        var startIndex = 0
        var wordIndex = 1
        var i = 0
        var wordListCopy = wordList
        var inputString = ""
        var compoundStringFound = false
        
        while  wordIndex > 0 {
            wordIndex = VerbUtilities().doesStringListContainSubstringList(inputStringList: wordListCopy, subStringList: inputWordList, startIndex : startIndex)
            //if phrase found, remove each word from the input wordListCopy and replace it with a single phrase string
            // for example, if the continguous words "a" "principios" "de" are found, then replace them with the multi-word phrase "a principios de"
            if ( wordIndex > 0 ){
                
                while i < inputWordList.count {
                    inputString += inputWordList[i] + " "
                    wordListCopy.remove(at:wordIndex)
                    i += 1
                }
                inputString = VerbUtilities().removeLeadingOrFollowingBlanks(characterArray: inputString)
                wordListCopy.insert(inputString, at: wordIndex)
                i=0
                inputString = ""
                compoundStringFound = true
            }
            startIndex = wordIndex + inputString.count  //jump startIndex past this "find" and look for another
        }
        if compoundStringFound { return (true, wordListCopy)}
        return (false, wordListCopy)
    }
    
    
    
    func getPunctuation(wordString: String)->SentenceData{
        var sd = SentenceData()
        let word = Punctuation(word: wordString, def: "", type : .period)
        let punct = word.isPunctuation(word: wordString)
        if punct != .none {
            sd.word = word
            sd.data.wordType = .punct
            sd.data.punctuationType = punct
        }
        return sd
    }
    
    func getArticle(wordString: String)->SentenceData{
        var sd = SentenceData()
        
        switch m_language {
        case .Spanish:
            for word in spanishWords.determinerList {
                //let determiner = word as! SpanishDeterminer
                sd.word = word
                sd.data.wordType = .Det
                sd.data.determinerType = .definite
                sd.data.gender = .either
                sd.data.number = .singular
                return sd
                }
        case .French:
            for word in frenchWords.determinerList {
                //let determiner = word as! FrenchDeterminer
                sd.word = word
                sd.data.wordType = .Det
                sd.data.determinerType = .definite
                sd.data.gender = .either
                sd.data.number = .singular
                return sd
                }
        case .English:
            for word in englishWords.determinerList {
                //let determiner = word as! EnglishDeterminer
                sd.word = word
                sd.data.wordType = .Det
                sd.data.determinerType = .definite
                sd.data.gender = .either
                sd.data.number = .singular
                return sd
                }
        case .Italian,.Portuguese, .Agnostic:
            return sd
        }
        return sd
        
    }
    
    
    func getAdjective(wordString: String)->SentenceData{
        
        var sd = SentenceData()
        switch m_language {
        case .Spanish:
            for word in spanishWords.adjectiveList {
                let adjective = word as! SpanishAdjective
                let result = adjective.isAdjective(word: wordString)
                if ( result.0 ) {
                    sd.word = word
                    sd.data.wordType = .Adj
                    sd.data.gender = result.1
                    sd.data.number = result.2
                    return sd
                }
            }
        case .French:
            for word in frenchWords.adjectiveList {
                let adjective = word as! FrenchAdjective
                let result = adjective.isAdjective(word: wordString)
                if ( result.0 ) {
                    sd.word = word
                    sd.data.wordType = .Adj
                    sd.data.gender = result.1
                    sd.data.number = result.2
                    return sd
                }
            }
        case .English:
            for word in englishWords.adjectiveList {
                let adjective = word as! EnglishAdjective
                let result = adjective.isAdjective(word: wordString)
                if ( result.0 ) {
                    sd.word = word
                    sd.data.wordType = .Adj
                    sd.data.number = result.1
                    return sd
                }
                
            }
        case .Italian,.Portuguese, .Agnostic:
            return sd
        }
        return sd
    }
    
    func getNoun(wordString:String)->SentenceData{
        
        var sd = SentenceData()
        switch m_language {
        case .Spanish:
            for word in spanishWords.nounList {
                let noun = word as! RomanceNoun
                let result = noun.isNoun(word: wordString)
                if result.0 {
                    sd.word = word
                    sd.data.wordType = .N
                    sd.data.nounType = result.1
                    sd.data.number = result.2
                    sd.data.gender = result.3
                    return sd
                }
                
            }
        case .French:
            for word in frenchWords.nounList {
                let noun = word as! RomanceNoun
                let result = noun.isNoun(word: wordString)
                if result.0 {
                    sd.word = word
                    sd.data.wordType = .N
                    sd.data.nounType = result.1
                    sd.data.number = result.2
                    sd.data.gender = result.3
                    return sd
                }
                
            }
        case .English:
            for word in englishWords.nounList {
                let noun = word as! EnglishNoun
                let result = noun.isNoun(word: wordString)
                if result.0 {
                    sd.word = word
                    sd.data.wordType = .N
                    sd.data.nounType = result.1
                    sd.data.number = result.2
                    return sd
                }
            }
        case .Italian,.Portuguese, .Agnostic:
            return sd
        }
        return sd
    }
    
    func getConjunction(wordString:String)->SentenceData{
        
        var sd = SentenceData()
        switch m_language {
        case .Spanish:
            for word in spanishWords.conjunctionList {
                if wordString == word.word {
                    let conj = word as! SpanishConjunction
                    let result = conj.isConjunction(word: wordString)
                    if result {
                        sd.word = word
                        sd.data.wordType = .C
                        return sd
                    }
                }
            }
        case .French:
            for word in frenchWords.conjunctionList {
                if wordString == word.word {
                    let conj = word as! FrenchConjunction
                    let result = conj.isConjunction(word: wordString)
                    if result {
                        sd.word = word
                        sd.data.wordType = .C
                        return sd
                    }
                }
            }
        case .English:
            for word in englishWords.conjunctionList {
                if wordString == word.word {
                    let prep = word as! EnglishConjunction
                    let result = prep.isConjunction(word: wordString)
                    if result {
                        sd.word = word
                        sd.data.wordType = .C
                        return sd
                    }
                }
            }
        case .Italian,.Portuguese, .Agnostic:
            return sd
        }
        return sd
    }
    
    
    func getPreposition(wordString:String)->SentenceData{
        
        var sd = SentenceData()
        switch m_language {
        case .Spanish:
            for word in spanishWords.prepositionList {
                if wordString == word.word {
                    let prep = word as! RomancePreposition
                    let result = prep.isPreposition(word: wordString)
                    if result {
                        sd.word = word
                        sd.data.wordType = .P
                        return sd
                    }
                }
            }
        case .French:
            for word in frenchWords.prepositionList {
                if wordString == word.word {
                    let prep = word as! RomancePreposition
                    let result = prep.isPreposition(word: wordString)
                    if result {
                        sd.word = word
                        sd.data.wordType = .P
                        return sd
                    }
                }
            }
        case .English:
            for word in englishWords.prepositionList {
                if wordString == word.word {
                    let prep = word as! EnglishPreposition
                    let result = prep.isPreposition(word: wordString)
                    if result {
                        sd.word = word
                        sd.data.wordType = .P
                        return sd
                    }
                }
            }
        case .Italian,.Portuguese, .Agnostic:
            return sd
        }
        return sd
    }
    
    /*
    func unConjugate(verbForm : String)->( Word, BSpanishVerb, Tense, Person)  {
        var conjugateForm = ""
        
        var count = 0
        var bVerb : BRomanceVerb
        for word in spanishWords.verbList{
            let verb = word as! RomanceVerb
            bVerb = verb.getBVerb()
            
            let wordList = bVerb.getInfinitiveAndParticiples()
            if ( verbForm == wordList.0 ){return (word, bVerb, Tense.infinitive, Person.S1)}
            else if ( verbForm == wordList.1 ){return (word, bVerb, Tense.pastParticiple, Person.S1)}
            else if ( verbForm == wordList.2 ){return (word, bVerb, Tense.presentParticiple, Person.S1)}
            
            for tense in Tense.indicativeAll {
                for person in Person.all {
                    
                    conjugateForm = bVerb.getConjugatedMorphStruct(tense: tense, person: person, conjugateEntirePhrase : false ).finalVerbForm()
                    if ( bVerb.m_verbWord == "haber")
                    {
                     //   print("unConjugate (\(bVerb.m_verbWord) - tense \(tense) - person \(person) - conjugateForm = \(conjugateForm)")
                    }
                    conjugateForm = VerbUtilities().removeLeadingOrFollowingBlanks(characterArray: conjugateForm)
                    if conjugateForm == verbForm {
                        print("verbString \(verbForm) was found in verb \(bVerb.m_verbWord) -- tense \(tense), person \(person).  \(count) verb forms were searched")
                        return (word, bVerb, tense, person)
                    }
                    count += 1
                }
            }
            
            for tense in Tense.subjunctiveAll {
                for person in Person.all {
                    conjugateForm = bVerb.getConjugatedMorphStruct(tense: tense, person: person, conjugateEntirePhrase : false ).finalVerbForm()
                    conjugateForm = VerbUtilities().removeLeadingOrFollowingBlanks(characterArray: conjugateForm)
                    if conjugateForm == verbForm {
                        print("verbString \(verbForm) was found in verb \(bVerb.m_verbWord) -- tense \(tense), person \(person).  \(count) verb forms were searched")
                        return (word, bVerb, tense, person)
                    }
                    count += 1
                }
            }
            
            //look for imperative
            let tense = Tense.imperative
            for person in Person.all {
                conjugateForm = bVerb.getConjugatedMorphStruct(tense: tense, person: person, conjugateEntirePhrase : false ).finalVerbForm()
                conjugateForm = VerbUtilities().removeLeadingOrFollowingBlanks(characterArray: conjugateForm)
                if conjugateForm == verbForm {
                    print("verbString \(verbForm) was found in verb \(bVerb.m_verbWord) -- tense \(tense), person \(person).  \(count) verb forms were searched")
                    return (word, bVerb, tense, person)
                }
                count += 1
            }

        }
        print("\(count) verb forms were searched")
        return (Word(), BSpanishVerb(), .present, .S1)
    }
*/
    
    func getVerb(wordString: String)->SentenceData{
        var sd = SentenceData()
        
        switch m_language {
        case .Spanish:
            for word in spanishWords.verbList {
                if wordString == word.word {
                    sd.word = word
                    sd.data.wordType = .V
                    sd.data.tense = .infinitive
                    return sd
                }
                /*
                else {
                    let result = unConjugate(verbForm : wordString)
                    let bVerb = result.1
                    if !bVerb.m_verbWord.isEmpty {
                        if ( bVerb.isAuxiliary() ){
                            sd.data.verbType = .auxiliary
                        }else if ( bVerb.m_verbWord == "estar" || bVerb.m_verbWord == "haber"){
                            sd.data.verbType = .auxiliary
                        }
                        sd.word = result.0
                        sd.data.wordType = .verb
                        sd.data.tense = result.2
                        sd.data.person = result.3
                        return sd
                    }
                    return sd
                }
 */
            }
        case .French:
            for word in frenchWords.verbList {
                if wordString == word.word {
                    sd.word = word
                    sd.data.wordType = .V
                    sd.data.tense = .infinitive
                    return sd
                }
                else {
                    let verb = word as! RomanceVerb
                    
                    let result = verb.isConjugateForm(word: wordString)
                    
                    if ( result.0 ){
                        sd.word = word
                        sd.data.wordType = .V
                        sd.data.tense = result.1
                        sd.data.person = result.2
                        return sd
                    }
                }
            }
        case .English:
            for word in englishWords.verbList {
                let verb = word as! EnglishVerb
                let result = verb.isConjugateForm(word: wordString)
                if ( result.0 ){
                    sd.word = word
                    sd.data.wordType = .V
                    sd.data.tense = result.1
                    sd.data.person = result.2
                    return sd
                }
            }
        case .Italian,.Portuguese, .Agnostic:
            return sd
        }
        return sd
    }
    
    func getObjectPronoun(wordString: String, type: PronounType)->SentenceData{
        var sd = SentenceData()
        let result : (PronounType, Gender, Person)
        switch m_language {
        case .Spanish:
            let pronoun = SpanishPronoun(word: wordString, type: type)
            if ( type == .DIRECT_OBJECT ){ result = pronoun.isDirectObjectPronoun(word: wordString) }
            else { result = pronoun.isIndirectObjectPronoun(word: wordString)}
            if result.0 != .none {
                sd.word = Pronoun(word: wordString, type: type)
                sd.data.wordType = .P
                sd.data.pronounType = result.0
                sd.data.gender = result.1
                sd.data.person = result.2
                return sd
            }
        case .French:
            return sd
        default:
            return sd
        }
        return sd
    }
    
    func getPronoun(wordString: String)->SentenceData{
        var sd = SentenceData()
        
        switch m_language {
        case .Spanish:
        
            for word in spanishWords.pronounList {
                let pronoun = word as! SpanishPronoun
                let pronounList = pronoun.isPronoun(word: wordString)
                if pronounList.count > 1 {
                    let amb = Ambiguous(word: wordString, type: .pronoun)
                    amb.setPronounList(list: pronounList)
                    sd.word = amb
                    sd.data.wordType = .AMB
                    sd.data.ambiguousType = .pronoun
                    return sd
                }
                var result = pronoun.isSubjectPronoun(word: wordString)
                if result.0 != .none {
                    sd.word = Pronoun(word: wordString, type: .SUBJECT)
                    sd.data.wordType = .PersPro
                    sd.data.pronounType = result.0
                    sd.data.gender = result.1
                    sd.data.person = result.2
                    return sd
                }
                result = pronoun.isReflexivePronoun(word: wordString)
                if result.0 != .none {
                    sd.word = Pronoun(word: wordString, type: .REFLEXIVE)
                    sd.data.wordType = .Pronoun
                    sd.data.pronounType = result.0
                    sd.data.gender = result.1
                    sd.data.person = result.2
                    return sd
                }
                result = pronoun.isIndirectObjectPronoun(word: wordString)
                if result.0 != .none {
                    sd.word = Pronoun(word: wordString, type: .INDIRECT_OBJECT)
                    sd.data.wordType = .Pronoun
                    sd.data.pronounType = result.0
                    sd.data.gender = result.1
                    sd.data.person = result.2
                    return sd
                }
                result = pronoun.isDirectObjectPronoun(word: wordString)
                if result.0 != .none {
                    sd.word = Pronoun(word: wordString, type: .DIRECT_OBJECT)
                    sd.data.wordType = .Pronoun
                    sd.data.pronounType = result.0
                    sd.data.gender = result.1
                    sd.data.person = result.2
                    return sd
                }
                result = pronoun.isPrepositionalPronoun(word: wordString)
                if result.0 != .none {
                    sd.word = Pronoun(word: wordString,type: .PREPOSITIONAL)
                    sd.data.wordType = .Pronoun
                    sd.data.pronounType = result.0
                    sd.data.gender = result.1
                    sd.data.person = result.2
                    return sd
                }
            }
        case .French:
            for word in frenchWords.pronounList {
                let pronoun = word as! FrenchPronoun
                let pronounList = pronoun.isPronoun(word: wordString)
                if pronounList.count > 1 {
                    let amb = Ambiguous(word: wordString, type: .pronoun)
                    amb.setPronounList(list: pronounList)
                    sd.word = amb
                    sd.data.wordType = .AMB
                    sd.data.ambiguousType = .pronoun
                    return sd
                }
                var result = pronoun.isSubjectPronoun(word: wordString)
                if result.0 != .none {
                    sd.word = Pronoun(word: wordString, type: .SUBJECT)
                    sd.data.wordType = .Pronoun
                    sd.data.pronounType = result.0
                    sd.data.gender = result.1
                    sd.data.person = result.2
                    return sd
                }
                result = pronoun.isReflexivePronoun(word: wordString)
                if result.0 != .none {
                    sd.word = Pronoun(word: wordString, type: .REFLEXIVE)
                    sd.data.wordType = .Pronoun
                    sd.data.pronounType = result.0
                    sd.data.gender = result.1
                    sd.data.person = result.2
                    return sd
                }
                result = pronoun.isIndirectObjectPronoun(word: wordString)
                if result.0 != .none {
                    sd.word = Pronoun(word: wordString, type: .INDIRECT_OBJECT)
                    sd.data.wordType = .Pronoun
                    sd.data.pronounType = result.0
                    sd.data.gender = result.1
                    sd.data.person = result.2
                    return sd
                }
                result = pronoun.isDirectObjectPronoun(word: wordString)
                if result.0 != .none {
                    sd.word = Pronoun(word: wordString, type: .DIRECT_OBJECT)
                    sd.data.wordType = .Pronoun
                    sd.data.pronounType = result.0
                    sd.data.gender = result.1
                    sd.data.person = result.2
                    return sd
                }
                result = pronoun.isPrepositionalPronoun(word: wordString)
                if result.0 != .none {
                    sd.word = Pronoun(word: wordString, type: .PREPOSITIONAL)
                    sd.data.wordType = .Pronoun
                    sd.data.pronounType = result.0
                    sd.data.gender = result.1
                    sd.data.person = result.2
                    return sd
                }
            }
            
        case .English:
            for word in englishWords.pronounList {
                let pronoun = word as! EnglishPronoun
                let result = pronoun.isSubjectPronoun(word: wordString)
                if result.0 != .none {
                    sd.word = word
                    sd.data.wordType = .Pronoun
                    sd.data.pronounType = result.0
                    sd.data.gender = result.1
                    sd.data.person = result.2
                }
            }
        case .Italian,.Portuguese, .Agnostic:
            return sd
        }
        return sd
        
    }
    
    func getDeterminer(wordString: String)->SentenceData{
        var sd = SentenceData()
        switch m_language {
        case .Spanish, .French:
            for word in spanishWords.determinerList {
                let determiner = word as! RomanceDeterminer
                let result = determiner.isDeterminer(word: wordString)
                if result.0 {
                    sd.word = word
                    sd.data.wordType = .Det
                    sd.data.determinerType = result.1
                    sd.data.gender = result.2
                    sd.data.number = result.3
                    return sd
                }
            }
        case .English:
            for word in englishWords.determinerList {
                let determiner = word as! EnglishDeterminer
                let result = determiner.isDeterminer(word: wordString)
                if result.0 {
                    sd.word = word
                    sd.data.wordType = .Det
                    sd.data.determinerType = result.1
                    sd.data.number = result.2
                    return sd
                }
            }
        case .Italian,.Portuguese, .Agnostic:
            return sd
        }
        return sd
    }
    
    
    
}

extension StringProtocol {
    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.lowerBound
    }
    func endIndex<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.upperBound
    }
    func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index] {
        ranges(of: string, options: options).map(\.lowerBound)
    }
    func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                result.append(range)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
