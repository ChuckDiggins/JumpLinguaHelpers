//
//  BFrenchVerb.swift
//  ContextFree
//
//  Created by Charles Diggins on 4/26/21.
//

import Foundation


public enum EndingType {
    case RE_ENDING
    case RE_ENDING1
    case RE_ENDING2
    case RE_ENDING3
    case IR_ENDING  //used by paraître imperfect
    case IR_ENDING1
    case IR_ENDING2
    case OIR_ENDING1
    case OIR_ENDING2
    case OIR_ENDING3
    case CHOIR_ENDING
    case overrideER
    case none
}

public struct ModelVerbEnding{
    var tense = Tense.gerund
    var type = EndingType.none
}

public class BFrenchVerb : BRomanceVerb {
    
    var p3PreteriteWord = ""

    var m_useThis = false
    
    var m_specialModel = SpecialFrenchVerbModel.none
    var m_isImpersonal1 = false
    var m_isImpersonal2 = false
    
    var m_presentStemChanging = false
    var m_presentStemFrom = ""
    var m_presentStemTo = ""
    
    var m_presentSubjStemChanging = false
    var m_presentSubjStemFrom = ""
    var m_presentSubjStemTo = ""
    
    var m_modelVerbEndingList = [ModelVerbEnding]()
    
    var m_verbModelParseList = [ParsedExceptionStruct]()
    
    public init(verbPhrase: String){
        super.init(verbPhrase: verbPhrase, language: .French)
    }
    
    public override init(){
         super.init(verbPhrase: "", language: .French)
    }
    
    public  override func setPatterns (verbModel : RomanceVerbModel) {
        bVerbModel = verbModel
       
        //bRomanceVerb specific
        initializeMorphStructs()
        if isReflexive() { addFrenchReflexiveMorphing() }

        //do some other stuff while we are at it
        m_verbStem = getVerbStem(verbWord : m_verbWord , verbEnding: m_verbEnding)
        m_verbModelParseList = bVerbModel.parseVerbModel()
        readModelParseStuff()
        m_pastParticiple = createPastParticiple()
        m_gerund = createGerund()
    }//SetPatterns
    
    public  override func createPastParticiple()->String {
        let result = hasReplaceEndingForm(tense: .pastParticiple)
        if result.0.count > 0 {
            var word = m_verbWord
            word = VerbUtilities().removeLastLetters(verbWord: word, letterCount: result.0.count)
            word += result.1
            return word
        }
        
        let word = m_verbStem
        switch m_verbEnding {
        case .AR: return word + "ado"
        case .ER: return word + "é"
        case .IR: return word + "i"
        case .OIR: return word + "u"
        case .RE: return word + "s"
        default: return word + "nada"
        }
    }
    
    public override func createGerund()->String {
        let word = m_verbStem
        switch m_verbEnding {
        case .AR: return word + "ando"
        case .ER, .IR, .accentIR: return word + "iendo"
        default: return word + "nada"
        }
    }
    
    public override func getConjugateForm(tense : Tense, person : Person)->String {
        _ = getConjugatedMorphStruct( tense : tense, person : person , conjugateEntirePhrase : false)
        return morphStructManager.getFinalVerbForm(person: person)
    }
    
    //these patterns are not mutually exclusive
    
    public override func getConjugatedMorphStruct( tense : Tense, person : Person , conjugateEntirePhrase : Bool, isPassive: Bool = false)->MorphStruct {
        
        //simple indicative tenses
        let tenseIndex =  tense.getIndex()
        
        var ms = self.morphStructManager.get(person: person)

        if tenseIndex <= Tense.future.getIndex() {
            ms = ActiveVerbConjugationFrench().conjugateThisSimpleIndicativeNew( verb: self, tense : tense, person : person, conjugateEntirePhrase : conjugateEntirePhrase )
        }
             
        else if ( tenseIndex == Tense.imperative.getIndex()){
            ms = ActiveVerbConjugationFrench().conjugateThisImperativeForm(verb: self, person: person, conjugateEntirePhrase: conjugateEntirePhrase)       
        }
        
        //simple subjunctive tenses
        
        else if tenseIndex >= Tense.presentSubjunctive.getIndex() && tenseIndex <= Tense.imperfectSubjunctiveSE.getIndex() {
            ms = ActiveVerbConjugationFrench().conjugateThisSimpleIndicativeNew( verb: self, tense : tense, person : person, conjugateEntirePhrase : conjugateEntirePhrase )
        }
        
        //perfect tenses - indicative and subjunctive
        
        else if tenseIndex >= Tense.presentPerfect.getIndex() && tenseIndex <= Tense.conditionalProgressive.getIndex() {
            ms = ActiveVerbConjugationFrench().conjugateThisCompoundVerb( verb: self, tense : tense, person : person, conjugateEntirePhrase : conjugateEntirePhrase )
        }
    
        //add residual phrase here
        if conjugateEntirePhrase && m_residualPhrase.count > 0 {
            let finalForm = ms.finalVerbForm()
            var morphStep = MorphStep()
            morphStep.isFinalStep = true
            morphStep.comment = "Add residual phrase -> \(m_residualPhrase)"
            morphStep.part1 = finalForm
            morphStep.part2 += " " + m_residualPhrase
            morphStep.verbForm = finalForm + " " + m_residualPhrase
            ms.append(morphStep : morphStep)
        }
        setMorphStruct(person: person, morphStruct: ms)
        return ms
    }
    
    public func restoreMorphStructs()
    {
        for person in Person.allCases {
            restoreMorphStructs(person: person)
        }
    }
    
    public func restoreMorphStructs(person : Person)
    {
        morphStructManager.restoreToInitialState()
    }

    
    public func readModelParseStuff(){
        
        for parseStruct in m_verbModelParseList {
            if ( parseStruct.pattern == .IMPERSONAL1){
                m_isImpersonal1 = true
            }
            
            if ( parseStruct.pattern == .IMPERSONAL2){
                m_isImpersonal2 = true
            }
            
            if ( parseStruct.pattern == .SPECIAL){
                m_isIrregular = true
                switch parseStruct.from {
                case "avoir" : m_specialModel = SpecialFrenchVerbModel.AVOIR
                case "être" : m_specialModel = SpecialFrenchVerbModel.ETRE  //using the model, so far
                
                default: break
                }
            }
            //if this exists, use it
            
            if ( parseStruct.pattern == .REPLACEINFINITIVE){
                m_isIrregular = true
                m_baseVerbInfinitive = parseStruct.from
                m_replacementVerbInfinitive = parseStruct.to
            }
            
            if ( parseStruct.pattern == .STEM && parseStruct.tense == .present){
                m_presentStemChanging = true
                m_presentStemFrom = parseStruct.from
                m_presentStemTo = parseStruct.to
            }
            
            if ( parseStruct.pattern == .STEM && parseStruct.tense == .presentSubjunctive){
                m_presentSubjStemChanging = true
                m_presentSubjStemFrom = parseStruct.from
                m_presentSubjStemTo = parseStruct.to
            }
            
            //if replacing, add it to the list
            
            if ( parseStruct.pattern == .REPLACE){
                m_isIrregular = true
                var replaceMultipleForm = ReplaceMultipleForm()
                replaceMultipleForm.personList = parseStruct.personList
                replaceMultipleForm.tense = parseStruct.tense
                replaceMultipleForm.fromWord = parseStruct.from
                replaceMultipleForm.toWord = parseStruct.to
                replaceMultipleList.append(replaceMultipleForm)
            }
            
            //if replacing, add it to the list
            
            if ( parseStruct.pattern == .REPLACEIT){
                m_isIrregular = true
                var replaceForm = ReplaceModelForm()
                replaceForm.person = parseStruct.personList[0]
                replaceForm.tense = parseStruct.tense
                replaceForm.fromWord = parseStruct.from
                replaceForm.toWord = parseStruct.to
                replaceModelList.append(replaceForm)
            }
            
            //if use different ending - such as Tenir --
            // right now:  tense=gerund means all relevant tenses will have short ending
            //             tense=present, or other tense, means only this tense will have short ending
            
            switch parseStruct.pattern{
            case .RE_ENDING: m_modelVerbEndingList.append(ModelVerbEnding(tense: parseStruct.tense, type: .RE_ENDING))
            case .RE_ENDING1: m_modelVerbEndingList.append(ModelVerbEnding(tense: parseStruct.tense, type: .RE_ENDING1))
            case .RE_ENDING2: m_modelVerbEndingList.append(ModelVerbEnding(tense: parseStruct.tense, type: .RE_ENDING2))
            case .RE_ENDING3: m_modelVerbEndingList.append(ModelVerbEnding(tense: parseStruct.tense, type: .RE_ENDING3))
            case .IR_ENDING: m_modelVerbEndingList.append(ModelVerbEnding(tense: parseStruct.tense, type: .IR_ENDING))
            case .IR_ENDING1: m_modelVerbEndingList.append(ModelVerbEnding(tense: parseStruct.tense, type: .IR_ENDING1))
            case .IR_ENDING2: m_modelVerbEndingList.append(ModelVerbEnding(tense: parseStruct.tense, type: .IR_ENDING2))
            case .OIR_ENDING1: m_modelVerbEndingList.append(ModelVerbEnding(tense: parseStruct.tense, type: .OIR_ENDING1))
            case .OIR_ENDING2: m_modelVerbEndingList.append(ModelVerbEnding(tense: parseStruct.tense, type: .OIR_ENDING2))
            case .OIR_ENDING3: m_modelVerbEndingList.append(ModelVerbEnding(tense: parseStruct.tense, type: .OIR_ENDING3))
            case .CHOIR_ENDING:
                m_modelVerbEndingList.append(ModelVerbEnding(tense: parseStruct.tense, type: .CHOIR_ENDING))
            case .OVERRIDE_ER: m_modelVerbEndingList.append(ModelVerbEnding(tense: parseStruct.tense, type: .overrideER))
            default: break
            }
            
            //if replacing, add it to the list
            
            if ( parseStruct.pattern == .STEMSINGLE){
                var stemSingleForm = StemSingleForm()
                stemSingleForm.person = parseStruct.personList[0]
                stemSingleForm.tense = parseStruct.tense
                stemSingleForm.fromWord = parseStruct.from
                stemSingleForm.toWord = parseStruct.to
                stemSingleList.append(stemSingleForm)
            }
            
            
            //if replacing, add it to the list
            
            if ( parseStruct.pattern == .DROPLETTERS){
                var dropLettersForm = DropLettersForm()
                dropLettersForm.personList = parseStruct.personList
                dropLettersForm.tense = parseStruct.tense
                dropLettersForm.fromWord = parseStruct.from
                dropLettersList.append(dropLettersForm)
            }
            
            //if replacing, add it to the list
            
            if ( parseStruct.pattern == .REPLACEENDING){
                m_isIrregular = true
                var form = ReplaceEndingForm()
                form.person = parseStruct.personList[0]
                form.tense = parseStruct.tense
                form.fromWord = parseStruct.from
                form.toWord = parseStruct.to
                replaceEndingList.append(form)
            }
            
            if ( parseStruct.pattern == .ORTHO){
                if ( parseStruct.tense == .present ){
                    m_orthoPresent = true
                    m_orthoPresentFrom = parseStruct.from
                    m_orthoPresentTo = parseStruct.to
                }
                if ( parseStruct.tense == .preterite ){
                    m_orthoPreterite = true
                    m_orthoPreteriteFrom = parseStruct.from
                    m_orthoPreteriteTo = parseStruct.to
                }
            }
        }

    }
        

}
