//
//  NounCluster.swift
//  ContextFree
//
//  Created by Charles Diggins on 4/14/21.
//

import Foundation

public class dNounSingle : dSingle
/*------------------------------------------------------------------
 Purpose: provide a phrase for handling noun
 single word clusters.
 ------------------------------------------------------------------*/
{
    public override init(){
        super.init(word: Word(), clusterType: .N, data: WordStateData())
    }
    
    public init(word: Word, data: WordStateData ){
        super.init(word: word, clusterType: .N, data: data)
        setGender(value: data.gender)
    }
    
    var      m_isSubject = false
    var      m_nounType = NounType.any
    func    setNounType (type : NounType){m_nounType = type}
    func    getNounType ()->NounType{return m_nounType}
    func    setIsSubject(flag:Bool){m_isSubject = flag}
    func   isSubject()->Bool{return m_isSubject}
    
    public override func copyGuts(newSingle: dSingle){
        putClusterWord(word: newSingle.getClusterWord())
        setSentenceData(data: newSingle.getSentenceData())
        //let sd = getSentenceData()
    }
    
    
    public override func    getWordString()->String{
        let sd = getSentenceData()
        let word = getClusterWord()
        
        switch sd.language {
        case .Spanish, .French:
            let noun = word as! RomanceNoun
            return noun.getNounString(number: sd.number)
        case .English:
            let noun = word as! EnglishNoun
            return noun.getString(number: sd.number)
        default:
            return ""
        }
    }
    
    public override func    getWordStringAtLanguage(language: LanguageType)->String{
        let sd = getSentenceData()
        let word = getClusterWord()
        let cn = word as! Noun
        switch language {
        case .Spanish:
            let noun = SpanishNoun(word: cn.spanish, type: sd.nounType, gender: sd.gender)
            return noun.getNounString(number: sd.number)
        case .French:
            let noun = FrenchNoun(word: cn.french,  type: sd.nounType, gender: sd.gender)
            return noun.getNounString(number: sd.number)
        case .English:
            let englishPlural = cn.englishPlural
            let noun = EnglishNoun(word: cn.english,  type: sd.nounType, englishPlural: englishPlural)
            return noun.getString(number: sd.number)
        default:
            return ""
        }
    }
    
    public override func getString()->String
    {
        return getWordString()
    }
    
} //dNounSingle

public class dNounPhrase : dPhrase {
    var      m_isSubject = false
    var      m_nounType  = NounType.any
    var      m_nounCount = 0   //can we use cluster.number for this?
    var      m_isPlural  = false
    
    var type = ContextFreeSymbol.NP
    public override init(){
        super.init(word: Word(), clusterType: type, data: WordStateData())
    }
    
    public override init(randomWord:RandomWordLists, phraseName: String, phraseType: ContextFreeSymbol){
        super.init(randomWord: randomWord, phraseName: phraseName, phraseType: phraseType)
    }
    
    public init(word: Word, data: WordStateData ){
        super.init(word: word, clusterType: type, data: data)
    }
    
    public func startsWithVowelSound()->Bool{
        return getNounSingle().startsWithVowelSound()
    }
    
    
    public func getNounSingle()->dNounSingle{
        let nounSingle = dNounSingle()
        for cluster in getClusterList(){
            if cluster.getClusterType() == .N {return cluster as! dNounSingle}
        }
        return nounSingle
    }
    
    public func reconcileForLanguage(language: LanguageType){
        let npSentenceData = getSentenceData()
        for cluster in getClusterList(){
            let sym = cluster.getClusterType()
            switch sym {
            case .Det:
                let sd = cluster.getSentenceData()
                sd.gender = npSentenceData.gender
                sd.number = npSentenceData.number
                let det = cluster as! dDeterminerSingle
                let ds = det.getWordStringAtLanguage(language: language)
                sd.setProcessedWord(language: language, str: ds)
                //print("ds: \(ds) - sd.processedWord: \(sd.getProcessedWord(language: language))")
            case .Adj:
                let sd = cluster.getSentenceData()
                sd.gender = npSentenceData.gender
                sd.number = npSentenceData.number
                let adj = cluster as! dAdjectiveSingle
                let adjStr = adj.getWordStringAtLanguage(language: language)
                sd.setProcessedWord(language: language, str: adjStr)
                //print("ds: \(adjStr) - sd.processedWord: \(sd.getProcessedWord(language: language))")
            case .PersPro:
                let sd = cluster.getSentenceData()
                sd.gender = npSentenceData.gender
                sd.number = npSentenceData.number
                sd.personalPronounType = npSentenceData.personalPronounType
                sd.pronounType = .SUBJECT
                let pps = cluster as! dPersonalPronounSingle
                let pronounString = pps.getWordStringAtLanguage(language: language)
                sd.setProcessedWord(language: language, str: pronounString)
                npSentenceData.pronounType = .SUBJECT
                //print("ds: \(adjStr) - sd.processedWord: \(sd.getProcessedWord(language: language))")
            case .NP:
                let np = cluster as! dNounPhrase
                np.reconcileForLanguage(language: language)
            case .PP :
                let pp = cluster as! dPrepositionPhrase
                pp.reconcile()
            default: break
            }
        }
    }
    
    public func reconcile(){
        let npSentenceData = getSentenceData()
        for cluster in getClusterList(){
            let sym = cluster.getClusterType()
            if ( sym == .Det ){
                var sd = cluster.getSentenceData()
                sd.gender = npSentenceData.gender
                sd.number = npSentenceData.number
                if sym == .Det {
                    let det = cluster as! dDeterminerSingle
                    let ds = det.getWordString()
                    sd.setProcessedWord(str: ds)
                    sd = cluster.getSentenceData()
                    print("ds: \(ds) - sd.processedWord: \(sd.getProcessedWord())")
                }
                else if sym == .Adj {
                    let adj = cluster as! dAdjectiveSingle
                    var adjStr = adj.getWordString()
                    let now = Date()
                    adjStr = now.description
                    sd.setProcessedWord(str: adjStr)
                }
                cluster.setSentenceData(data: sd)
            }
            else if sym == .NP {
                let np = cluster as! dNounPhrase
                np.reconcile()
            }
            else if sym == .PP {
                let pp = cluster as! dPrepositionPhrase
                pp.reconcile()
            }
        }
    }
    
    
    public override func getPerson()->Person{
        for cluster in getClusterList() {
            let clusterType = cluster.getClusterType()
            if clusterType == .PersPro {
                let c = cluster as! dPersonalPronounSingle
                let person = c.getPerson()
                getSentenceData().person = person
                if cluster.getPronounType() == .SUBJECT {m_isSubject = true}
                return person      
            }
            else if clusterType == .N {
                let c = cluster as! dNounSingle
                let person = c.getPerson()
                getSentenceData().person = person
                return person
            }
        }
        return .S3
    }
    
    public func setAsSubject(flag : Bool){
        m_isSubject = flag
    }
    
    public func    setNounType (type : NounType){m_nounType = type}
    public func    getNounType ()->NounType{return m_nounType}
    
    public override func setPerson(value: Person){
        for cluster in getClusterList() {
            let clusterType = cluster.getClusterType()
            if clusterType == .PersPro {
                let c = cluster as! dPersonalPronounSingle
                c.setPerson(value: value)
                if cluster.getPronounType() == .SUBJECT {m_isSubject = true}
            }
        }
    }
    
    
}

public class dNounClause : dClause {
    
    var type = ContextFreeSymbol.NP
    public override init(){
        super.init(word: Word(), clusterType: type)
    }
    
    public init(word: Word, data: WordStateData ){
        super.init(word: word, clusterType: type)
    }
    
    
    var      m_nounType  = NounType.any
}


