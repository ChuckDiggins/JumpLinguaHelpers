//
//  BescherelleActiveVerbConjugation.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 3/11/21.
//

//Chuck Nov 25
import Foundation
import JumpLinguaHelpers

public class ActiveVerbConjugationSpanish {
    var perfectVerb = [[String]]()  //Spanish ... haber
    var progressiveVerb = [[String]]() //Spanish ... estar
    var specialVerbsFilled = false
    //var bescherelleModelConjugation = BescherelleModelConjugation()
    var p3PreteriteVerbWord = ""
    
    //this is so much easier than trying to construct these verbs on the fly
    // plus, there is no morphing history to deal with
    
    // .... if they care they can l
    public func fillHaberAndEstar(){
        perfectVerb = [
            ["he", "has", "ha", "hemos", "habéis", "han"],
            ["había", "habías", "había", "habíamos","habíais","habían"],
            ["hube", "hubiste", "hubo", "hubimos", "hubisteis", "hubieron"],
            ["habré", "habrás", "habrá", "habremos", "habréis", "habrán"],
            ["habría", "habrías", "habría", "habríamos", "habríais", "habrían"],
            ["haya", "hayas", "haya", "hayamos", "hayais", "hayan" ],
            ["hubiera", "hubieras", "hubiera", "hubiéramos", "hubierais", "hubieran"],
            ["hubiese", "hubieses", "hubiese", "hubiésemos", "hubieseis", "hubiesen"]
        ]
        progressiveVerb = [
            ["estoy", "estás", "está", "estamos", "estáis", "están"],
            ["estaba", "estabas", "estábamos", "estaba", "estaba", "estaba"],
            ["estaré", "estarás", "estará", "estaremos", "estaréis", "estarán" ],
            ["estaría", "estarías", "estaría", "estaríamos", "estaríais", "estarían" ]
        ]
        specialVerbsFilled = true
    }
    
    public func getPerfectVerb(tense: Tense, person: Person)->String {
        if !specialVerbsFilled {fillHaberAndEstar()}
        let tenseIndex = tense.getPerfectIndex()
        let personIndex = person.getIndex()
        return perfectVerb[tenseIndex][personIndex]
    }
    
    public func getProgressiveVerb(tense: Tense, person: Person)->String {
        if !specialVerbsFilled {fillHaberAndEstar()}
        let tenseIndex = tense.getProgressiveIndex()
        let personIndex = person.getIndex()
        return progressiveVerb[tenseIndex][personIndex]
    }
    
    //indicative and subjunctive
    
    public  func createInitialMorphSteps(verb: BSpanishVerb, person : Person, conjugateEntirePhrase: Bool)->MorphStruct
    {
    var workingMorphStruct = verb.getMorphStruct(person: person)
    let preposition = verb.m_residualPhrase
    var pronounString = ""
    var morphStep = MorphStep()
    var hasPhrase = false
    
    workingMorphStruct.clear()
    if conjugateEntirePhrase {
        workingMorphStruct.clear()
        
        
        morphStep.verbForm = verb.m_verbWord
        if verb.isReflexive() {
            morphStep.verbForm += "se"
            hasPhrase = true
        }
        if verb.hasPreposition() {
            morphStep.verbForm += " " + preposition
            hasPhrase = true
        }
        
        morphStep.comment = getMorphComment(.startWith, verb.getPhrase())
        
        morphStep.part1 = verb.getPhrase()
        morphStep.part2 = ""
        morphStep.part3 = ""
        workingMorphStruct.append(morphStep : morphStep)
        
        if  verb.isReflexive() {
            pronounString = Pronoun().getReflexive(language: .Spanish, person: person, startsWithVowelSound: false) + " "
            
            //grab the reflexive pronoun
            morphStep.verbForm = verb.m_verbWord
            morphStep.part1 = verb.m_verbWord
            morphStep.part2 = "se"
            morphStep.comment = getMorphComment(.grabReflexivePronoun, "se")
            workingMorphStruct.append(morphStep : morphStep)
            
            //if S3 or P3, then pronoun 'se' does not have to change
            
            //convert to correct person and move in front of verb
            if  person != .S3 && person != .P3 {
                var morphStep = MorphStep()
                morphStep.part1 = ""
                morphStep.part2 = pronounString
                morphStep.part3 = verb.m_verbWord + " " + preposition
                morphStep.verbForm = pronounString + " " + verb.m_verbWord + " " + preposition
                morphStep.comment = getMorphComment(.convertReflexivePronoun, pronounString)
                workingMorphStruct.append(morphStep : morphStep)
            } else {
                var morphStep = MorphStep()
                morphStep.part1 = ""
                morphStep.part2 = pronounString
                morphStep.part3 = verb.m_verbWord + " " + preposition
                morphStep.verbForm = pronounString + " " + verb.m_verbWord + " " + preposition
                morphStep.comment = getMorphComment(.moveReflexivePronoun, pronounString)
                workingMorphStruct.append(morphStep : morphStep)
            }
        }
    }
    else {
        morphStep.comment = "Start with verb infinitive " + verb.m_verbWord
        morphStep.comment = getMorphComment(.startWith, verb.m_verbWord)
        morphStep.verbForm = verb.m_verbWord
        morphStep.part1 = verb.m_verbWord
        workingMorphStruct.append(morphStep : morphStep)
    }
    return workingMorphStruct
    }
    
    public func conjugateThisImperativeForm(verb : BSpanishVerb, person : Person, conjugateEntirePhrase : Bool, isNegative: Bool = false ) -> MorphStruct {
        switch(person){
        case .S1:
            var ms = MorphStruct(person: .S1)
            var word = verb.m_verbWord
            word.removeLast()
            var morphStep = MorphStep()
            morphStep.comment = "There is no command form for first person singular"
            morphStep.verbForm = ""
            ms.append(morphStep: morphStep)
            return ms
        case .S2:
            if ( isNegative ){
                return conjugateThisSimpleIndicativeNew(verb: verb, tense: .presentSubjunctive, person: .S2, conjugateEntirePhrase: false)
            } else {
                let replaceEndingForm = verb.hasReplaceEndingForm(tense: .imperative, person: .S2)
                if ( replaceEndingForm.0.count > 0 ){
                    return conjugateThisSimpleIndicativeNew(verb: verb, tense: .imperative, person: .S2, conjugateEntirePhrase: false)
                }
                else {
                    return conjugateThisSimpleIndicativeNew(verb: verb, tense: .present, person: .S3, conjugateEntirePhrase: false)
                }
            }
        case .S3: return conjugateThisSimpleIndicativeNew(verb: verb, tense: .presentSubjunctive, person: .S3, conjugateEntirePhrase: false)
        case .P1: return conjugateThisSimpleIndicativeNew(verb: verb, tense: .presentSubjunctive, person: .P1, conjugateEntirePhrase: false)
        case .P2:
            var ms = MorphStruct(person: .S1)
            var morphStep = MorphStep()
            var word = verb.m_verbWord
            morphStep.verbForm = word
            morphStep.part1 = word
            morphStep.comment = getMorphComment(.startWith, word)
            ms.append(morphStep: morphStep)
            
            morphStep = MorphStep()
            word.removeLast()
            morphStep.verbForm = word
            morphStep.part1 = word
            morphStep.comment = getMorphComment(.removeLastLetter, "")
            ms.append(morphStep: morphStep)
            
            morphStep.verbForm = word+"d"
            morphStep.part1 = word
            morphStep.part2 = "d"
            morphStep.comment = getMorphComment(.appendEnding, "d")
            ms.append(morphStep: morphStep)
            return ms
        case .P3: return conjugateThisSimpleIndicativeNew(verb: verb, tense: .presentSubjunctive, person: .P3, conjugateEntirePhrase: false)
        }
    }
    
    public func conjugateImperativeTense(verb : BSpanishVerb, person : Person , conjugateEntirePhrase : Bool )->MorphStruct{
        var workingMorphStruct = verb.getMorphStruct(tense: .imperative, person: person)
        let replaceEndingForm = verb.hasReplaceEndingForm(tense: .imperative, person: person)
        if ( replaceEndingForm.0.count > 0 ){
            workingMorphStruct = RegularSpanishVerb().createImperativeS2Form(inputMorphStruct : workingMorphStruct, changeFrom : replaceEndingForm.0, changeTo : replaceEndingForm.1)
            workingMorphStruct.isIrreg = true
            return workingMorphStruct
        }
        return workingMorphStruct
    }
    
    public func conjugateThisSimpleIndicativeNew(verb : BSpanishVerb, tense : Tense, person : Person , conjugateEntirePhrase : Bool ) -> MorphStruct {
        
        var verbConjugated = false
        let p3PreteriteVerbForm = verb.getP3PreteriteForm()
        let preposition = ""
        
        BSpanishVerbExtras().restoreMorphStructs(verb: verb)
        
        //this is where we decide whether to use standard, stem or pretStem morphStruct
        
        var workingMorphStruct = verb.getMorphStruct(tense: tense, person: person)
        
        if tense == Tense.imperative {
            return conjugateImperativeTense(verb: verb, person: person, conjugateEntirePhrase: conjugateEntirePhrase)
        }
        if ( verb.m_replacementVerbInfinitive.count > 0  && (tense == .future || tense == .conditional )){
            workingMorphStruct = replaceVerbInfinitive(inputMorphStruct : workingMorphStruct, baseInfinitive: verb.m_baseVerbInfinitive,  replacementInfinitive: verb.m_replacementVerbInfinitive)
        }
        
        
        let verbWord = workingMorphStruct.finalVerbForm()
        
        
        if ( verb.m_specialModel != SpecialSpanishVerbModel.none ){
            workingMorphStruct = IrregularVerbsSpanish().getIrregularFormSpecial(inputMorphStruct : workingMorphStruct, verb : verb, preposition : "",
                                specialVerbModel : verb.m_specialModel,
                                tense : tense, person : person)
            //print("tense \(tense), person \(person) -- \(workingMorphStruct.finalVerbForm())")
            workingMorphStruct.isIrreg = true
            if workingMorphStruct.isComplete() {return workingMorphStruct}
        }
        
        //if this verb has a verb model at this tense/person, then conjugate it ... otherwise it's regular
        let replaceForm = verb.hasReplaceForm(tense: tense, person: person)
        if ( replaceForm.0.count > 0 ){
            return StemChangingConjugation().createStemConjugatedForm(inputMorphStruct : workingMorphStruct, verb: verb, tense: tense, person : person, stemFrom: replaceForm.0, stemTo : replaceForm.1)
        }
        
        //preterite tense replace ending forms are handled below
        
        let replaceEndingForm = verb.hasReplaceEndingForm(tense: tense, person: person)
        if ( replaceEndingForm.0.count > 0 && tense != .preterite){
            return StemChangingConjugation().createStemConjugatedForm(inputMorphStruct : workingMorphStruct, verb: verb, tense: tense, person : person, stemFrom: replaceForm.0, stemTo : replaceForm.1)
        }
        
        //can we intercept the stem-changing infinitive here?
        let result = verb.hasStemSingleForm(tense: tense, person: person)
        if ( result.0 != "" ){
            //do the stem change first
            workingMorphStruct = StemChangingConjugation().createStemConjugatedForm(inputMorphStruct : workingMorphStruct, verb: verb, tense: tense, person : person, stemFrom: result.0, stemTo : result.1)
            //then if there is any ortho, do it here
            if verb.isOrthoPresent(tense: tense, person: person) {
                let from = verb.m_orthoPresentFrom
                let to = verb.m_orthoPresentTo
                workingMorphStruct = RegularSpanishVerb().createStemOrthoForm(verbEnding : verb.m_verbEnding, inputMorphStruct : workingMorphStruct, verbWord : verbWord, preposition : preposition, tense : tense, person : person, orthoFrom: from, orthoTo: to)
            }
            if verb.isOrthoPresentSubjunctive(tense: tense, person: person){
                let from = verb.m_orthoPresentSubjunctiveFrom
                let to = verb.m_orthoPresentSubjunctiveTo
                workingMorphStruct = RegularSpanishVerb().createStemOrthoForm(verbEnding : verb.m_verbEnding, inputMorphStruct : workingMorphStruct, verbWord : verbWord, preposition : preposition, tense : tense, person : person, orthoFrom: from, orthoTo: to)
            }
            workingMorphStruct = RegularSpanishVerb().attachRegularVerbEnding(morphStruct: workingMorphStruct, tense: tense, person: person, verbEnding: verb.m_verbEnding)
            verbConjugated = true
            return workingMorphStruct
        }
        
        //stem changing - but don't go yet, check for ortho present
        if verb.isStemChanging() {
            if (tense == .present || tense == .presentSubjunctive) && verb.isPersonStem(person: person) {
                //do the stem change first
                workingMorphStruct = StemChangingConjugation().createStemConjugatedForm(inputMorphStruct : workingMorphStruct, verb: verb, tense: tense, person : person, stemFrom: verb.m_stemFrom, stemTo : verb.m_stemTo)
                //then if there is any ortho, do it here
                if verb.isOrthoPresent(tense: tense, person: person) {
                    let from = verb.m_orthoPresentFrom
                    let to = verb.m_orthoPresentTo
                    workingMorphStruct = RegularSpanishVerb().createStemOrthoForm(verbEnding : verb.m_verbEnding, inputMorphStruct : workingMorphStruct, verbWord : verbWord, preposition : preposition, tense : tense, person : person, orthoFrom: from, orthoTo: to)
                }
                if verb.isOrthoPresentSubjunctive(tense: tense, person: person) && tense == .presentSubjunctive {
                    let from = verb.m_orthoPresentSubjunctiveFrom
                    let to = verb.m_orthoPresentSubjunctiveTo
                    workingMorphStruct = RegularSpanishVerb().createStemOrthoForm(verbEnding : verb.m_verbEnding, inputMorphStruct : workingMorphStruct, verbWord : verbWord, preposition : preposition, tense : tense, person : person, orthoFrom: from, orthoTo: to)
                }
                workingMorphStruct = RegularSpanishVerb().attachRegularVerbEnding(morphStruct: workingMorphStruct, tense: tense, person: person, verbEnding: verb.m_verbEnding)
                verbConjugated = true
                
                return workingMorphStruct
            }
        }
        
        
        //preterite specific stem conjugations
        if ( tense == .preterite ){
            if ( verb.isPretStemChanging() ){
                workingMorphStruct =  StemChangingConjugation().createStemConjugatedForm(inputMorphStruct : workingMorphStruct, verb: verb, tense: tense, person : person, stemFrom : verb.m_pretStemFrom, stemTo : verb.m_pretStemTo)
                workingMorphStruct = StemChangingConjugation().attachPretStemEnding(inputMorphStruct: workingMorphStruct,  person: person)
                verbConjugated = true
            }
            else if ( verb.isPretStem2Changing() && verb.isPersonPretStem2(person: person)){
                workingMorphStruct =   StemChangingConjugation().createStemConjugatedForm(inputMorphStruct : workingMorphStruct, verb: verb, tense: tense, person : person, stemFrom : verb.m_pretStem2From, stemTo : verb.m_pretStem2To)
                workingMorphStruct = StemChangingConjugation().attachPretStem2Ending(inputMorphStruct: workingMorphStruct, person: person)
                verbConjugated = true
            }
            else if ( verb.isPretStem3Changing() && verb.isPersonPretStem3(person: person)){
                workingMorphStruct = StemChangingConjugation().createPretStem3ConjugatedForm(inputMorphStruct : workingMorphStruct, verbWord : verbWord, person : person)
                verbConjugated = true
            }
            
            let replaceEndingForm = verb.hasReplaceEndingForm(tense: tense, person: person)
            if ( replaceEndingForm.0.count>0 ){
                workingMorphStruct = RegularSpanishVerb().replaceForm(inputMorphStruct : workingMorphStruct, person: person, from: replaceEndingForm.0, to : replaceEndingForm.1)
            }
            if verbConjugated {
                return workingMorphStruct
            }
            
        }
        
        if verb.isOrthoPreterite(tense: tense, person: person) {
            let from = verb.m_orthoPreteriteFrom
            let to = verb.m_orthoPreteriteTo
            return RegularSpanishVerb().createRegularOrthoForm(verbEnding : verb.m_verbEnding, inputMorphStruct : workingMorphStruct, verbWord : verbWord, preposition : preposition, tense : tense, person : person, orthoFrom: from, orthoTo: to)
        }
        
        if verb.isOrthoPresent(tense: tense, person: person){
            let from = verb.m_orthoPresentFrom
            let to = verb.m_orthoPresentTo
            return RegularSpanishVerb().createRegularOrthoForm(verbEnding : verb.m_verbEnding, inputMorphStruct : workingMorphStruct, verbWord : verbWord, preposition : preposition, tense : tense, person : person, orthoFrom: from, orthoTo: to)
        }
        
        if verbConjugated {
            return workingMorphStruct
        }
        else {
            //treat this verb as a "regular" verb
            
            return RegularSpanishVerb().createRegularForm(verbEnding : verb.m_verbEnding, inputMorphStruct : workingMorphStruct, verbWord : verbWord, preposition : preposition, tense : tense, person : person, p3PreteriteVerbFormInput: p3PreteriteVerbForm)
        }
    }
    
    public func replaceVerbInfinitive(inputMorphStruct : MorphStruct, baseInfinitive : String, replacementInfinitive : String)-> MorphStruct{
        
        var workingMorphStruct = inputMorphStruct
        let base = baseInfinitive
        var verbWord = inputMorphStruct.finalVerbForm()
        
        var morphStep = MorphStep()
        morphStep.isFutureStem = true
        //        morphStep.comment = "Grab base infinitive ->\(base)"
        morphStep.comment = getMorphComment(.grabInfinitive, base)
        morphStep.verbForm = verbWord
        workingMorphStruct.append(morphStep : morphStep)
        
        //strip it out
        
        verbWord = String(verbWord.dropLast(base.count))
        
        morphStep = MorphStep()
        //        morphStep.comment = "Replace infinitive with this form ->\(replacementInfinitive)"
        morphStep.comment = getMorphComment(.replaceWith, replacementInfinitive)
        morphStep.verbForm = verbWord + replacementInfinitive
        workingMorphStruct.append(morphStep : morphStep)
        return workingMorphStruct
    }
    
    public  func conjugateThisCompoundVerb(verb : BSpanishVerb, tense : Tense, person : Person , conjugateEntirePhrase : Bool ) -> MorphStruct {
        let preposition = ""
        
        var auxiliaryVerb = ""
        var participle = ""
        
        if tense.isProgressive() {
            auxiliaryVerb = self.getProgressiveVerb(tense: tense, person: person)
            participle = verb.m_gerund
        } else {
            auxiliaryVerb = self.getPerfectVerb(tense: tense, person: person)
            participle = verb.m_pastParticiple
        }
        
        var pronounString = ""
        //when verb is reflexive and/or has a verb phrase sitting after the verb
        var workingMorphStruct = createInitialMorphSteps(verb: verb, person: person, conjugateEntirePhrase: conjugateEntirePhrase)
        var morph = MorphStep()
        
        //????
        if verb.isReflexive() {
            pronounString = Pronoun().getReflexive(language: .Spanish, person: person, startsWithVowelSound: false)
        }
        
        //preposition = " " + verb.m_residualPhrase
        
        var ss = pronounString + " " + participle
        
        if tense.isProgressive(){
            morph.comment = getMorphComment(.replaceWithPresentParticiple, participle)
        }
        else {
            morph.comment = getMorphComment(.replaceWithPastParticiple, participle)
        }
        morph.part1 = pronounString
        morph.part2 = " " + participle
        morph.part3 = " " + preposition
        morph.verbForm = ss + " " + preposition
        workingMorphStruct.append(morphStep: morph)
        
        morph = MorphStep()
        morph.isFinalStep = true
        
        if tense.isProgressive() { morph.comment = getMorphComment(.insertEstar, auxiliaryVerb)}
        else { morph.comment = getMorphComment(.insertHaber, auxiliaryVerb) }
        morph.part1 = pronounString
        morph.part2 = " " + auxiliaryVerb
        morph.part3 = " " + participle + " " + preposition
        ss = pronounString + " " + auxiliaryVerb + " " + participle + " " + preposition
        morph.verbForm = ss
        workingMorphStruct.append(morphStep: morph)
        return workingMorphStruct
    }
    
}
