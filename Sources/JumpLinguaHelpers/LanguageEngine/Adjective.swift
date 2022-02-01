//
//  ViperAdjective.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 3/30/21.
//

import Foundation

public class Adjective : Word {

    var plural = ""
    var type : AdjectiveType
    var preferredPosition = AdjectivePositionType.preceding
    
    public override init(){
        self.type = AdjectiveType.any
        super.init(word: "",  wordType: .adjective)
    }
    
    public init(word: String, type : AdjectiveType){
        self.type = type
        super.init(word: word, wordType: .adjective)
    }

    public init(jsonAdjective: JsonAdjective, language: LanguageType){
        self.type = AdjectiveType.any
        
        switch(language){
        case .Spanish:  super.init(word: jsonAdjective.spanish, wordType: .noun)
        case .French:  super.init(word: jsonAdjective.french, wordType: .noun)
        case .English:  super.init(word: jsonAdjective.english, wordType: .noun)
        default:
            super.init(word: jsonAdjective.spanish, wordType: .adjective)
        }
        self.spanish = jsonAdjective.spanish
        self.french = jsonAdjective.french
        self.english = jsonAdjective.english
        
        convertAdjectiveTypeStringToAdjectiveTypes(inputString: jsonAdjective.adjectiveType)
        convertFavoriteNounStringToFavoriteNouns(inputString: jsonAdjective.nounLikes)
    }
    
    public func convertAdjectiveTypeStringToAdjectiveTypes(inputString: String){
        type = .any
        if ( inputString == "C" ){type = .color}
        if ( inputString == "D" ){type = .demonstrative}
        if ( inputString == "P" ){type = .possessive}
        if ( inputString == "T" ){type = .nationality}
    }
    
    public func convertFavoriteNounStringToFavoriteNouns(inputString: String){
        /*let util = VerbUtilities()
        let strList = getNounTypesAsStringList()
        for str in strList {
            if util.doesWordContainLetter(inputString: inputString, letter: str) {
                print(str)
                //favoriteSubjects.append(getNounTypeFromString(str: str))}
            }
        }
 */
    }
    
    public func setPreferredPosition(position: AdjectivePositionType){
        preferredPosition = position
    }
    
    public func getPreferredPosition()->AdjectivePositionType{
        return preferredPosition
    }
    
}

public class RomanceAdjective : Adjective {
    
    var gender = Gender.feminine
    var number = Number.plural
    var femWord : String = ""
    var mascPlural : String = ""
    var femPlural : String = ""
    
    public override init(word: String, type: AdjectiveType)
    {
        super.init(word: word, type: type)
        super.setPreferredPosition(position: .following)
    }
    
    public override init(jsonAdjective: JsonAdjective, language: LanguageType){
        super.init(jsonAdjective: jsonAdjective, language: language)
    }
    
    public func getForm(gender: Gender, number: Number)->String{
        switch gender{
        case .masculine, .either:
            switch (number){
            case .singular: return word
            case .plural: return mascPlural
            }
        case .feminine:
            switch (number){
            case .singular: return femWord
            case .plural: return femPlural
            }
        }
    }
    
    public func getForms()->(word: String, plural: String, femWord: String, femPlural: String){
        return (word: word, plural: mascPlural, femWord: femWord, femPlural: femPlural)
    }
    
    public func createForms(){
        femWord = word
    }
}


//mostly spanish  -- these are the last letters to determine how to create a plural form

public enum SpanishAdjectiveEndingType : String{
    case O = "o"
    case L = "l"
    case Z = "z"
    case AN = "án"
    case ON = "on"
    case IN = "ín"
    case OR = "or"
    case ES = "és"
    case ETE = "ete"
    case OTE = "ote"
    case Vowel = ""
    case Unknown = "UNK"
}

public enum FrenchAdjectiveEndingType : String{
    case e = "e"
    case x = "x"
    case f = "f"
    case c = "c"
    case s = "s"
    case on = "on"
    case en = "en"
    case el = "el"
    case il = "il"
    case et = "et"  //  ??
    case er = "er"  //  ??
    case eil = "eil"
    case eur = "eur"
    case Unknown = "UNK"
}


public class FrenchAdjective : RomanceAdjective {
    public override init(word: String, type: AdjectiveType)
    {
        super.init(word: word, type: type)
        self.createFemaleForms()
        self.createSuperlatives()
    }
    
    public init(jsonAdjective: JsonAdjective){
        super.init(jsonAdjective: jsonAdjective, language: .French)
    }
    
    public func isAdjective(word: String) -> (Bool, Gender, Number)
    {
        if ( word == self.word ){return (true, .masculine, .singular) }
        if ( word == self.femWord ){return (true, .feminine, .singular)}
        if ( word == self.mascPlural ){return (true, .masculine, .plural)}
        if ( word == self.femPlural ){return (true, .feminine, .plural)}
        return (false, .masculine, .singular)
    }
    
    public func determineAdjectiveEnding()->FrenchAdjectiveEndingType{
        let util = VerbUtilities()
        var endingType = FrenchAdjectiveEndingType.Unknown
        
        var ending : String
        
        //look for 1-letter suffix
        
        ending = util.getLastNCharactersInString(inputString: word, copyCount: 1)
        if ending == FrenchAdjectiveEndingType.x.rawValue { endingType = FrenchAdjectiveEndingType.x }
        else if ending == FrenchAdjectiveEndingType.f.rawValue { endingType = FrenchAdjectiveEndingType.f}
        else if ending == FrenchAdjectiveEndingType.c.rawValue { endingType = FrenchAdjectiveEndingType.c }
        else if ending == FrenchAdjectiveEndingType.s.rawValue { endingType = FrenchAdjectiveEndingType.s }
        

        //look for 2-letter suffix
        
        if ( endingType == .Unknown ){
            ending = util.getLastNCharactersInString(inputString: word, copyCount: 2)
            if ending == FrenchAdjectiveEndingType.on.rawValue { endingType = FrenchAdjectiveEndingType.on }
            else if ending == FrenchAdjectiveEndingType.en.rawValue { endingType = FrenchAdjectiveEndingType.en }
            else if ending == FrenchAdjectiveEndingType.el.rawValue { endingType = FrenchAdjectiveEndingType.el }
            else if ending == FrenchAdjectiveEndingType.il.rawValue { endingType = FrenchAdjectiveEndingType.il }
            else if ending == FrenchAdjectiveEndingType.et.rawValue { endingType = FrenchAdjectiveEndingType.et }
            else if ending == FrenchAdjectiveEndingType.er.rawValue { endingType = FrenchAdjectiveEndingType.er }
        }
        if ( endingType == .Unknown ){
            ending = util.getLastNCharactersInString(inputString: word, copyCount: 3)
            if ending == FrenchAdjectiveEndingType.eil.rawValue { endingType = FrenchAdjectiveEndingType.eil }
            else if ending == FrenchAdjectiveEndingType.eur.rawValue { endingType = FrenchAdjectiveEndingType.eur }
        }
        return endingType
    }
    
    public func createSuperlatives(){
        createFemaleForms()
    }
    
    public func createOtherForms(){
        createFemaleForms()
    }
    
    public func createFemaleForms(){
         let endingType = determineAdjectiveEnding()

         var stem : String = ""
     
        switch endingType {
        case .e:    // ??????????????????????
            stem = word
            stem.removeLast()
            femWord = stem + "e"
        case .c:    // exception:  grec - grecque, public - publique
            stem = word
            stem.removeLast()
            femWord = stem + "che"
        case .s:
            stem = word
            stem.removeLast()
            femWord = stem + "sse"
        case .x:
            stem = word
            stem.removeLast()
            femWord = stem + "se"
        case .f:
            stem = word
            stem.removeLast()
            femWord = stem + "ve"
        case .on:
            stem = word
            stem.removeLast()
            stem.removeLast()
            femWord = stem + "onne"
        case .en:
            stem = word
            stem.removeLast()
            stem.removeLast()
            femWord = stem + "enne"
        case .el:
            stem = word
            stem.removeLast()
            stem.removeLast()
            femWord = stem + "elle"
        case .er:
            stem = word
            stem.removeLast()
            stem.removeLast()
            femWord = stem + "ère"
        case .et:
            stem = word
            stem.removeLast()
            stem.removeLast()
            femWord = stem + "ette"  //or secrète or prête!
        case .il:
            stem = word
            stem.removeLast()
            stem.removeLast()
            femWord = stem + "ille"
        case .eur:
            stem = word
            stem.removeLast()
            stem.removeLast()
            stem.removeLast()
            femWord = stem + "euse"  //p.36 comparative ... rice, eure
        case .eil:
            stem = word
            stem.removeLast()
            stem.removeLast()
            stem.removeLast()
            femWord = stem + "eille"
        case .Unknown:
            femWord = word
        }
        mascPlural = word + "s"
        femPlural = femWord + "s"
    }

}

public class FrenchPossessiveAdjective : RomanceAdjective {
    
    public override init(word: String, type: AdjectiveType)
    {
        super.init(word: "mon", type: type)
    }
    
    public func getForm(person : Person, gender: Gender)->String{
        switch gender{
        case .masculine:
            switch person{
            case .S1: return "mon"
            case .S2: return "ton"
            case .S3: return "son"
            case .P1: return "notre"
            case .P2: return "votre"
            case .P3: return "leur"
            }
        case .feminine:
            switch person{
            case .S1: return "mon"
            case .S2: return "ton"
            case .S3: return "son"
            case .P1: return "notre"
            case .P2: return "votre"
            case .P3: return "leur"
            }
        case .either:
            switch person{
            case .S1: return "mes"
            case .S2: return "tes"
            case .S3: return "ses"
            case .P1: return "nos"
            case .P2: return "vos"
            case .P3: return "leurs"
            }
        }
    }
}

public class FrenchInterrogativeAdjective : RomanceAdjective {
    
    public override init(word: String, type: AdjectiveType)
    {
        super.init(word: "quel", type: type)
        femWord = "quelle"
        mascPlural = "quels"
        femPlural = "quelles"
    }
    
}

public class FrenchDemonstrativeAdjective : RomanceAdjective {
    
    public override init(word: String, type: AdjectiveType)
    {
        super.init(word: "ce", type: type)
        femWord = "cette"
        mascPlural = "ces"
        femPlural = "ces"
    }
    
    public func getSpecialForm()->String{  //masc, singular before a vowel sound
        return "cet"  //
    }
    
}




public class SpanishAdjective : RomanceAdjective {
    public override init(word: String, type: AdjectiveType )
    {
        super.init(word: word, type: type)
        self.createOtherForms()
    }
    
    public init(jsonAdjective: JsonAdjective){
        super.init(jsonAdjective: jsonAdjective, language: .Spanish)
    }
    
    public func determineAdjectiveEnding()->SpanishAdjectiveEndingType{
        let util = VerbUtilities()
        var endingType = SpanishAdjectiveEndingType.Unknown
        
        var ending : String
        
        //look for 1-letter suffix
        
        ending = util.getLastNCharactersInString(inputString: word, copyCount: 1)
        if ending == SpanishAdjectiveEndingType.O.rawValue { endingType = SpanishAdjectiveEndingType.O }
        //else if ending == IsVowel(ending) { endingType = AdjectiveEndingType.Vowel}
        else if ending == SpanishAdjectiveEndingType.Z.rawValue { endingType = SpanishAdjectiveEndingType.Z }
        else if ending == SpanishAdjectiveEndingType.L.rawValue { endingType = SpanishAdjectiveEndingType.L }

        //look for 2-letter suffix
        
        if ( endingType == .Unknown ){
            ending = util.getLastNCharactersInString(inputString: word, copyCount: 2)
            if ending == SpanishAdjectiveEndingType.AN.rawValue { endingType = SpanishAdjectiveEndingType.AN }
            else if ending == SpanishAdjectiveEndingType.IN.rawValue { endingType = SpanishAdjectiveEndingType.IN }
            else if ending == SpanishAdjectiveEndingType.ON.rawValue { endingType = SpanishAdjectiveEndingType.ON }
            else if ending == SpanishAdjectiveEndingType.OR.rawValue { endingType = SpanishAdjectiveEndingType.OR }
            else if ending == SpanishAdjectiveEndingType.ES.rawValue { endingType = SpanishAdjectiveEndingType.ES }
        }
        
        //look for 3-letter suffix

        if ( endingType == .Unknown ){
            ending = util.getLastNCharactersInString(inputString: word, copyCount: 3)
            if ending == SpanishAdjectiveEndingType.ETE.rawValue { endingType = SpanishAdjectiveEndingType.ETE }
            else if ending == SpanishAdjectiveEndingType.OTE.rawValue { endingType = SpanishAdjectiveEndingType.OTE }
        }
        return endingType
    }
    

    public func createOtherForms(){
        let endingType = determineAdjectiveEnding()

        var stem : String = ""
    
        switch endingType {
        case .O:
            mascPlural = word + "s"
            stem = word
            stem.removeLast()
            femWord = stem + "a"
            femPlural = stem + "as"
        case .L:   //azul
            mascPlural = word + "es"
            femWord = word
            femPlural = word + "es"
        case .Vowel:
            mascPlural = word + "s"
            stem = word
            stem.removeLast()
            femWord = stem + "a"
            femPlural = stem + "as"
        case .Z:
            mascPlural = word
            stem = word
            stem.removeLast()
            femWord = word + "a"
            femPlural = word + "as"
        case .OTE, .ETE:
            femWord = word
            mascPlural = word + "s"
            femPlural = femWord + "s"
        case .AN:
            stem = word
            stem.removeLast()
            stem.removeLast()
            femWord += "ana"
            mascPlural = femWord
            mascPlural.removeLast()
            mascPlural += "es"
            femPlural = femWord + "s"
        case .ES:
            stem = word
            stem.removeLast()
            stem.removeLast()
            femWord += "esa"
            mascPlural = femWord
            mascPlural.removeLast()
            mascPlural += "es"
            femPlural = femWord + "s"
        case .IN:
            stem = word
            stem.removeLast()
            stem.removeLast()
            femWord += "ina"
            mascPlural = femWord
            mascPlural.removeLast()
            mascPlural += "es"
            femPlural = femWord + "s"
        case .ON:
            stem = word
            stem.removeLast()
            stem.removeLast()
            femWord += "ona"
            mascPlural = femWord
            mascPlural.removeLast()
            mascPlural += "es"
            femPlural = femWord + "s"
        case .OR:
            stem = word
            stem.removeLast()
            stem.removeLast()
            femWord += "ora"
            mascPlural = femWord
            mascPlural.removeLast()
            mascPlural += "es"
            femPlural = femWord + "s"
        
        case .Unknown:
            femWord = word
            femPlural = femWord + "s"
            mascPlural = word + "s"
        }

    }
    
    public func isAdjective(word: String) -> (Bool, Gender, Number)
    {
        if ( word == self.word ){return (true, .masculine, .singular) }
        if ( word == self.femWord ){return (true, .feminine, .singular)}
        if ( word == self.mascPlural ){return (true, .masculine, .plural)}
        if ( word == self.femPlural ){return (true, .feminine, .plural)}
        return (false, .masculine, .singular)
    }
}

public class EnglishAdjective : Adjective {
    
    public override init(word: String, type: AdjectiveType){
        super.init(word: word, type: type)
    }
    
    public override init(jsonAdjective: JsonAdjective, language: LanguageType){
        super.init(jsonAdjective: jsonAdjective, language: language)
    }
    
    public func getForm(gender: Gender, number: Number)->String{
        return word
    }
    
    public func getForm()->String{
        return word
    }
    
    public func isAdjective(word: String) -> (Bool, Number)
    {
        if ( word == self.word ) {return (true, .singular)}
        return (false, .singular)
    }
}

    
    
