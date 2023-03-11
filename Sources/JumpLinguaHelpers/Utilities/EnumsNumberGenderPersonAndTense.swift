//
//  EnumsPersonAndTense.swift
//  EnumsPersonAndTense
//
//  Created by Charles Diggins on 11/26/21.
//

import Foundation


public enum Number : String
{
    case singular
    case plural
    public static var all = [singular, plural]
}

public enum Gender : String
{
    case masculine = "M"
    case feminine = "F"
    case either = "E"
    
    public static var all = [masculine, feminine, either]
}

public enum SubjectPronounType : String {
    case maleFormal = "male formal"
    case femaleFormal = "female formal"
    case maleInformal = "male informal"
    case femaleInformal = "female informal"
    case all = "all forms"
}

public enum  Person:  Int, CaseIterable
{
    case S1 = 0
    case S2 = 1
    case S3 = 2
    case P1 = 3
    case P2 = 4
    case P3 = 5
    
    public static var all = [S1, S2, S3, P1, P2, P3]
      
    public func getPassivePerson(count: Number)->Person {
        if ( count == .singular){
            return .S3
        }
        return .P3
    }
    
    public func getEnumString()->String{
        switch self {
        case .S1: return "S1"
        case .S2: return "S2"
        case .S3: return "S3"
        case .P1: return "P1"
        case .P2: return "P2"
        case .P3: return "P3"
        }
    }
    
    public func getIndex()->Int{
        switch self {
        case .S1: return 0
        case .S2: return 1
        case .S3: return 2
        case .P1: return 3
        case .P2: return 4
        case .P3: return 5
        }
    }
    
    public func getPretStem2Ending()->String{
        switch self {
        case .S1: return "no pretStem3 ending for S1"
        case .S2: return "no pretStem3 ending for S2"
        case .S3: return "ió"
        case .P1: return "no pretStem3 ending for P1"
        case .P2: return "no pretStem3 ending for P2"
        case .P3: return "ieron"
        }
    }
    
    //used after ñ or ll
    public func getSoftPretStem2Ending()->String{
        switch self {
        case .S1: return "no pretStem3 ending for S1"
        case .S2: return "no pretStem3 ending for S2"
        case .S3: return "ó"
        case .P1: return "no pretStem3 ending for P1"
        case .P2: return "no pretStem3 ending for P2"
        case .P3: return "eron"
        }
    }
    
    public func getPretStem3Ending()->String{
        switch self {
        case .S1: return "no pretStem3 ending for S1"
        case .S2: return "íste"
        case .S3: return "yó"
        case .P1: return "ímos"
        case .P2: return "ísteis"
        case .P3: return "yeron"
        }
    }
    
    public func getReirPretStem3Ending()->String{
        switch self {
        case .S1: return "rei"
        case .S2: return "reíste"
        case .S3: return "rió"
        case .P1: return "reímos"
        case .P2: return "reísteis"
        case .P3: return "rieron"
        }
    }
    
    public func getFrenchString()->String {
        switch self {
        case .S1: return "je"
        case .S2: return "tu"
        case .S3: return "elle"
        case .P1: return "nous"
        case .P2: return "vous"
        case .P3: return "ils"
        }
    }
    
    public func getEnglishMaleString()->String {
        switch self {
        case .S1: return "I"
        case .S2: return "you"
        case .S3: return "he"
        case .P1: return "we"
        case .P2: return "you"
        case .P3: return "they"
        }
    }
    
    public func getEnglishFemaleString()->String {
        switch self {
        case .S1: return "I"
        case .S2: return "you"
        case .S3: return "she"
        case .P1: return "we"
        case .P2: return "you"
        case .P3: return "they"
        }
    }
    
    public func getFemaleString()->String {
        switch self {
        case .S1: return "yo"
        case .S2: return "tú"
        case .S3: return "ella"
        case .P1: return "nosotras"
        case .P2: return "vosotras"
        case .P3: return "ellas"
        }
    }
    
    public func getMaleString()->String {
        switch self {
        case .S1: return "yo"
        case .S2: return "tú"
        case .S3: return "él"
        case .P1: return "nosotros"
        case .P2: return "vosotros"
        case .P3: return "ellos"
            
        }
    }
    
    public func getUstedString()->String {
        switch self {
        case .S1: return "yo"
        case .S2: return "tú"
        case .S3: return "usted"
        case .P1: return "nosotros"
        case .P2: return "vosotros"
        case .P3: return "ustedes"
            
        }
    }
    
    public func getImperativeString()->String {
        switch self {
        case .S1: return ""
        case .S2: return "tú"
        case .S3: return "usted"
        case .P1: return "nosotros"
        case .P2: return "vosotros"
        case .P3: return "ustedes"
            
        }
    }
    
    public func getPassiveString()->String {
        switch self {
        case .S1: return "me"
        case .S2: return "te"
        case .S3: return "le"
        case .P1: return "nos"
        case .P2: return "os"
        case .P3: return "les"
            
        }
    }
    
    public func getPassiveString(language: LanguageType, verbStartsWithVowel: Bool)->String {
           switch language {
           case .Spanish:
               switch self {
               case .S1: return "me"
               case .S2: return "te"
               case .S3: return "le"
               case .P1: return "nos"
               case .P2: return "os"
               case .P3: return "les"
               }
           case .French:
               switch self {
               case .S1:
                   if (verbStartsWithVowel){ return "j'"}
                   else { return "je" }
               case .S2: return "tu"
               case .S3: return "elle"
               case .P1: return "nous"
               case .P2: return "vous"
               case .P3: return "ils"
               }
           case .English:
               switch self {
               case .S1: return "I"
               case .S2: return "you"
               case .S3: return "he"
               case .P1: return "we"
               case .P2: return "you"
               case .P3: return "they"
               }
           default:  return ""
           }
       }
    
    public func getIndirectObjectPronounString(language: LanguageType, verbStartsWithVowel: Bool = false)->String {
        switch language {
        case .Spanish:
            switch self {
            case .S1: return "me"
            case .S2: return "te"
            case .S3:  return "le"
            case .P1: return "nos"
            case .P2: return "os"
            case .P3: return "les"
            }
        case .French:
            switch self {
            case .S1:
                if (verbStartsWithVowel){ return "m'"}
                else { return "me" }
            case .S2:
                if (verbStartsWithVowel){ return "t'"}
                else { return "te" }
            case .S3: return "lui"
            case .P1: return "nous"
            case .P2: return "vous"
            case .P3: return "leur"
            }
        case .English:
            switch self {
            case .S1: return "me"
            case .S2: return "you"
            case .S3: return "him"
            case .P1: return "we"
            case .P2: return "you"
            case .P3: return "them"
            }
        default:  return "?"
        }
    }
   
    public func getPrepositionalPronounString(language: LanguageType, gender: Gender, verbStartsWithVowel: Bool = false, useUstedForm: Bool = false)->String {
        switch gender {
        case .masculine: return getMalePrepositionalPronounString(language: language, verbStartsWithVowel: verbStartsWithVowel, useUstedForm: useUstedForm)
        case .feminine: return getFemalePrepositionalPronounString(language: language, verbStartsWithVowel: verbStartsWithVowel, useUstedForm: useUstedForm)
        default:
            return getMalePrepositionalPronounString(language: language, verbStartsWithVowel: verbStartsWithVowel, useUstedForm: useUstedForm)
        }
    }
    
    private func getMalePrepositionalPronounString(language: LanguageType, verbStartsWithVowel: Bool = false, useUstedForm: Bool = false)->String {
        switch language {
        case .Spanish:
            switch self {
            case .S1: return "mí"
            case .S2: return "ti"
            case .S3:
                if (useUstedForm){ return "usted"}
                else { return "él" }
            case .P1: return "nosotros"
            case .P2: return "vosotros"
            case .P3:
                if (useUstedForm){ return "ustedes"}
                else { return "ellos" }
            }
        case .French:
            switch self {
            case .S1:return "moi"
            case .S2: return "toi"
            case .S3: return "lui"
            case .P1: return "nous"
            case .P2: return "vous"
            case .P3: return "eux"
            }
        case .English:
            switch self {
            case .S1: return "me"
            case .S2: return "you"
            case .S3: return "him"
            case .P1: return "we"
            case .P2: return "you"
            case .P3: return "them"
            }
        default:  return ""
        }
    }
    
    private func getFemalePrepositionalPronounString(language: LanguageType, verbStartsWithVowel: Bool = false, useUstedForm: Bool = false)->String {
        switch language {
        case .Spanish:
            switch self {
            case .S1: return "mí"
            case .S2: return "ti"
            case .S3:
                if (useUstedForm){ return "usted"}
                else { return "ella" }
            case .P1: return "nosotras"
            case .P2: return "vosotras"
            case .P3:
                if (useUstedForm){ return "ustedes"}
                else { return "ellas" }
            }
        case .French:
            switch self {
            case .S1:return "moi"
            case .S2: return "toi"
            case .S3: return "elle"
            case .P1: return "nous"
            case .P2: return "vous"
            case .P3: return "eux"
            }
        case .English:
            switch self {
            case .S1: return "me"
            case .S2: return "you"
            case .S3: return "him"
            case .P1: return "we"
            case .P2: return "you"
            case .P3: return "them"
            }
        default:  return ""
        }
    }
    
    public func getSubjectString(language: LanguageType, subjectPronounType: SubjectPronounType, verbStartsWithVowel: Bool = false)->String {
        switch subjectPronounType {
        case .maleFormal: return getMaleSubjectString(language: language, verbStartsWithVowel: verbStartsWithVowel, useUstedForm: true)
        case .maleInformal: return getMaleSubjectString(language: language, verbStartsWithVowel: verbStartsWithVowel, useUstedForm: false)
        case .femaleFormal: return getFemaleSubjectString(language: language, verbStartsWithVowel: verbStartsWithVowel, useUstedForm: true)
        case .femaleInformal: return getFemaleSubjectString(language: language, verbStartsWithVowel: verbStartsWithVowel, useUstedForm: false)
        default:
            return getMaleSubjectString(language: language, verbStartsWithVowel: verbStartsWithVowel, useUstedForm: false)
        }
    }
    
    
    public func getSubjectString(language: LanguageType, gender: Gender, verbStartsWithVowel: Bool = false, useUstedForm: Bool = false)->String {
        switch gender {
        case .masculine: return getMaleSubjectString(language: language, verbStartsWithVowel: verbStartsWithVowel, useUstedForm: useUstedForm)
        case .feminine: return getFemaleSubjectString(language: language, verbStartsWithVowel: verbStartsWithVowel, useUstedForm: useUstedForm)
        default:
            return getMaleSubjectString(language: language, verbStartsWithVowel: verbStartsWithVowel, useUstedForm: useUstedForm)
        }
    }
    
    private func getMaleSubjectString(language: LanguageType, verbStartsWithVowel: Bool = false, useUstedForm: Bool = false)->String {
            switch language {
            case .Spanish:
                switch self {
                case .S1: return "yo"
                case .S2: return "tú"
                case .S3:
                    if (useUstedForm){ return "usted"}
                    else { return "él" }
                case .P1: return "nosotros"
                case .P2: return "vosotros"
                case .P3:
                    if (useUstedForm){ return "ustedes"}
                    else { return "ellos" }
                }
            case .French:
                switch self {
                case .S1:
                    if (verbStartsWithVowel){ return "j'"}
                    else { return "je" }
                case .S2: return "tu"
                case .S3: return "elle"
                case .P1: return "nous"
                case .P2: return "vous"
                case .P3: return "ils"
                }
            case .English:
                switch self {
                case .S1: return "I"
                case .S2: return "you"
                case .S3: return "he"
                case .P1: return "we"
                case .P2: return "you"
                case .P3: return "they"
                }
            default:  return ""
            }
        }
    
    private func getFemaleSubjectString(language: LanguageType, verbStartsWithVowel: Bool = false, useUstedForm: Bool = false)->String {
            switch language {
            case .Spanish:
                switch self {
                case .S1: return "yo"
                case .S2: return "tú"
                case .S3:
                    if (useUstedForm){ return "usted"}
                    else { return "ella" }
                case .P1: return "nosotras"
                case .P2: return "vosotras"
                case .P3:
                    if (useUstedForm){ return "ustedes"}
                    else { return "ellas" }
                }
            case .French:
                switch self {
                case .S1:
                    if (verbStartsWithVowel){ return "j'"}
                    else { return "je" }
                case .S2: return "tu"
                case .S3: return "elle"
                case .P1: return "nous"
                case .P2: return "vous"
                case .P3: return "elles"
                }
            case .English:
                switch self {
                case .S1: return "I"
                case .S2: return "you"
                case .S3: return "she"
                case .P1: return "we"
                case .P2: return "you"
                case .P3: return "they"
                }
            default:  return ""
            }
        }


}

public enum  Tense : String, CustomStringConvertible, CaseIterable
{
    case present = "Present"
    case preterite = "Preterite"
    case imperfect = "Imperfect"
    case conditional = "Conditional"
    case future = "Future"
    case presentPerfect = "Pres Perf"
    case pastPerfect = "Past Perf"
    case preteritePerfect = "Pret Perf"
    case futurePerfect = "Future Perf"
    case conditionalPerfect = "Cond Perf"
    case presentSubjunctive = "Pres Subj"
    case imperfectSubjunctiveRA = "ImpSubj-ra"
    case imperfectSubjunctiveSE = "ImpSubj-se"
    case presentPerfectSubjunctive = "Pres Perf Subj"
    case pastPerfectSubjunctiveRA = "Past Perf Subj-ra"
    case pastPerfectSubjunctiveSE = "Past Perf Subj-se"
    case imperative = "Imperative"
    case nosotrosCommand = "We Command"  //Let's do this!
    case presentProgressive = "Pres Prog"
    case imperfectProgressive = "Imperf Prog"
    case futureProgressive = "Future Prog"
    case conditionalProgressive = "Cond Prog"
    case presentParticiple = "Pres Part"
    case pastParticiple = "Past Part"
    case infinitive = "Infinitive"
    case gerund = "Gerund"
    
    static var specialFormsAll =
        [Tense.presentParticiple, .pastParticiple, .infinitive]
    static var indicativeAll =
        [Tense.present, .preterite, .imperfect, .conditional, .future]
    static var perfectIndicativeAll =
        [Tense.presentPerfect, Tense.pastPerfect, .preteritePerfect, .futurePerfect, .conditionalPerfect]
    static var subjunctiveAll = [Tense.presentSubjunctive, .imperfectSubjunctiveRA,.imperfectSubjunctiveSE ]
    static var perfectSubjunctiveAll =
        [Tense.presentPerfectSubjunctive, .pastPerfectSubjunctiveRA, .pastPerfectSubjunctiveSE]
    static var progressiveAll =
    [Tense.presentProgressive, .imperfectProgressive, .futureProgressive, .conditionalProgressive]
    
    public var description:  String {return rawValue}
    
    public func getSimpleTenseFromCompoundTense()->Tense{
        switch self {
        case .presentProgressive: return .present
        case .imperfectProgressive: return .imperfect
        case .futureProgressive: return .future
        case .conditionalProgressive: return .conditional
        case .presentPerfect: return .present
        case .pastPerfect: return .imperfect
        case .preteritePerfect: return .preterite
        case .futurePerfect: return .future
        case .conditionalPerfect: return .conditional
        default: return self
        }
    }
    
    public func isSimpleTense() -> Bool {
        if Tense.subjunctiveAll.contains(self){ return true }
        if Tense.indicativeAll.contains(self){ return true }
        if self == .imperative { return true }
        return false
    }
    
    public func isSubjunctive() -> Bool {
        if Tense.subjunctiveAll.contains(self) || Tense.perfectSubjunctiveAll.contains(self) {return true}
        return false
    }
    
    public func isPerfectIndicative() -> Bool {
        if Tense.perfectIndicativeAll.contains(self) {return true}
        return false
    }
    
    public func isProgressiveIndicative() -> Bool {
        if Tense.progressiveAll.contains(self) {return true}
        return false
    }
    
    public func getSpanishString()->String {
        switch self {
        case .present: return "presente de indicativo"
        case .preterite: return "pretérito"
        case .imperfect: return "imperfecto de indicativo"
        case .future: return "futuro"
        case .conditional: return "condicional simple"
        case .presentSubjunctive: return "presente de subjuntivo"
        case .imperfectSubjunctiveRA: return "imperfecto de subjuntivo - RA"
        case .imperfectSubjunctiveSE: return "imperfecto de subjuntivo - SE"
        case .presentPerfectSubjunctive : return "preterito perfecto subj"
        case .pastPerfectSubjunctiveRA : return "pret pluscuamperfecto subj - ra"
        case .pastPerfectSubjunctiveSE : return "pret pluscuamperfecto subj - se"
        case .imperative: return "imperativo"
        case .presentPerfect: return "presente perfecto"
        case .futurePerfect: return "futuro perfecto"
        case .preteritePerfect: return "pretérito perfecto"
        default:
            return "to be determined later"
        }
    }
    
    public func getPerfectTense()->Tense{
        switch self {
        case .present: return .presentPerfect
        case .preterite: return .preteritePerfect
        case .imperfect: return .pastPerfect
        case .future: return .futurePerfect
        case .conditional: return .conditionalPerfect
        case .presentSubjunctive: return .presentPerfectSubjunctive
        case .imperfectSubjunctiveRA: return .pastPerfectSubjunctiveRA
        case .imperfectSubjunctiveSE: return .pastPerfectSubjunctiveSE
        default: return .present
        }
    }
    
    public func getProgressiveTense()->Tense{
        switch self {
        case .present: return .presentProgressive
        case .imperfect: return .imperfectProgressive
        case .future: return .futureProgressive
        case .conditional: return .conditionalProgressive
        default: return .present
        }
    }
    
    public func getPerfectIndex()->Int{
        switch self {
        case .presentPerfect: return 0
        case .pastPerfect: return 1
        case .preteritePerfect: return 2
        case .futurePerfect: return 3
        case .conditionalPerfect: return 4
        case .presentPerfectSubjunctive: return 5
        case .pastPerfectSubjunctiveRA: return 6
        case .pastPerfectSubjunctiveSE: return 7
        default:
            return -1
        }
    }
         
    public func getProgressiveIndex()->Int{
        switch self {
        case .presentProgressive:return 0
        case .imperfectProgressive:return 1
        case .futureProgressive:return 2
        case .conditionalProgressive:return 3
        default:
            return -1
        }
    }
    
    public func isProgressive()->Bool{
        if self == .presentProgressive || self == .imperfectProgressive || self == .futureProgressive || self == .conditionalProgressive {
            return true
        }
        return false
    }
    
    
    public func getIndex()->Int{
        switch self {
        case .present: return 0
        case .imperfect: return 1
        case .preterite: return 2
        case .conditional: return 3
        case .future: return 4
    
        case .presentPerfect: return 5
        case .pastPerfect: return 6
        case .preteritePerfect: return 7
        case .futurePerfect: return 8
        case .conditionalPerfect: return 9
            
        case .presentSubjunctive : return 10
        case .imperfectSubjunctiveRA : return 11
        case .imperfectSubjunctiveSE: return 12
            
        case .presentPerfectSubjunctive: return 13
        case .pastPerfectSubjunctiveRA: return 14
        case .pastPerfectSubjunctiveSE: return 15

        case .imperative : return 16
        case .nosotrosCommand: return 17
            
        case .presentProgressive : return 18
        case .imperfectProgressive : return 19
        case .futureProgressive : return 20
        case .conditionalProgressive : return 21

        case .presentParticiple: return 22
        case .pastParticiple: return 23
        case .infinitive:  return 24
        case .gerund:  return 25
        }
    }
}
