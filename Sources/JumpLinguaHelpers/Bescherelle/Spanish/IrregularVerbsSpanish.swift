//
//  VerbFormsIrregularSpecial.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 2/20/21.
//

import Foundation

//these are standalone irregular forms
public enum SpecialSpanishVerbModel {
    case ESTAR
    case HABER
    case REIR
    case SABER
    case SONREIR
    case IR
    case OIR
    case SER
    case VER
    case none
}

public struct IrregularVerbsSpanish {
    public init(){}
    public func getIrregularFormSpecial(inputMorphStruct : MorphStruct, verb : BSpanishVerb, preposition : String,
                                 specialVerbModel : SpecialSpanishVerbModel,
                                 tense : Tense, person : Person)->MorphStruct{
        
        
        let morphStruct = inputMorphStruct
        
        switch (specialVerbModel){
            
        case .HABER:
            return getFormHaber(inputMorphStruct : morphStruct, preposition : preposition, tense : tense, person : person)
        case .ESTAR:
            return getFormEstar(inputMorphStruct : morphStruct, preposition : preposition, tense : tense, person : person)
        case .IR:
            return getFormIr(inputMorphStruct : morphStruct, preposition : preposition, tense : tense, person : person)
        case .OIR:
            return getFormOir(inputMorphStruct : morphStruct, preposition : preposition, tense : tense, person : person)
        case .REIR:
            return getFormReir(inputMorphStruct : morphStruct, preposition : preposition, tense : tense, person : person)
        case .SABER:
          return getFormSaber(inputMorphStruct : morphStruct, preposition : preposition, tense : tense, person : person)
        case .SER:
            return getFormSer(inputMorphStruct : morphStruct, preposition : preposition,  tense : tense, person : person)
        case .SONREIR:
            return getFormSonreir(inputMorphStruct : morphStruct, preposition : preposition, tense : tense, person : person)
        case .VER:
            return getFormVer(inputMorphStruct : morphStruct, preposition : preposition,  tense : tense, person : person)
        case .none:
            return morphStruct
        }
        
    }
    
    
    /*
     ??
     ??
     ??
     ??
     ??
     ????
     ??
     ??
     ??
     */
    
    public func getFormEstar (inputMorphStruct : MorphStruct, preposition : String, tense: Tense, person: Person ) -> MorphStruct {
        var workingMorphStruct = inputMorphStruct
        var morph : MorphStep
        var ending : String
        morph = MorphStep()
        morph.isIrregular = true

        switch (tense){
        case .present:
            morph.isFinalStep = true
            switch person{
            case .S1:
            morph.verbForm = "estoy" + preposition
            morph.comment = "Replace with irregular form: estoy"
            workingMorphStruct.append(morphStep: morph)
            case .S2:
            morph.verbForm = "est??s" + preposition
            morph.comment = "Replace with irregular form: est??s"
            workingMorphStruct.append(morphStep: morph)
            case .S3:
            morph.verbForm = "est??" + preposition
            morph.comment = "Replace with irregular form: est??"
            workingMorphStruct.append(morphStep: morph)
            case .P3:
            morph.verbForm = "est??n" + preposition
            morph.comment = "Replace with irregular form: est??n"
            workingMorphStruct.append(morphStep: morph)
            default: break
            }
        case .preterite:
            morph.verbForm = "estuv_"
            morph.comment = "Replace with irregular stem " + "estuv_"

            workingMorphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "estuv"
            switch person{
            case .S1: ending = "e"
            case .S2: ending = "iste"
            case .S3: ending =  "o"
            case .P1: ending = "imos"
            case .P2: ending = "isteis"
            case .P3: ending = "ieron"
            }
            morph.verbForm = morph.verbForm + ending + preposition
            morph.comment = "Add the ending -> " + ending + preposition
            morph.isFinalStep = true
            workingMorphStruct.append(morphStep: morph)

        case .presentSubjunctive:
            morph.verbForm = "est_"
            morph.comment = "Replace with irregular stem " + "est_"

            workingMorphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "est"
            morph.isFinalStep = true
            switch person{
            case .S1: ending = "??"
            case .S2: ending = "??s"
            case .S3: ending =  "??"
            case .P1: ending = "emos"
            case .P2: ending = "??is"
            case .P3: ending = "??n"
            }
            morph.verbForm = morph.verbForm + ending + preposition
            morph.comment = "Add the ending -> " + ending + preposition
            workingMorphStruct.append(morphStep: morph)

        case .imperfectSubjunctiveRA:
 
            morph.verbForm = "estuvieron"
            morph.comment = "Start with ellos-form estuvieron"

            workingMorphStruct.append(morphStep: morph)
            
            morph = MorphStep()
   
            morph.verbForm = "estuvie__"
            morph.comment = "Remove the ending 'ron', leaving 'estuvie...'"

            workingMorphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "estuvi"
            morph.isFinalStep = true
            switch person{
            case .S1: ending = "era"
            case .S2: ending = "eras"
            case .S3: ending =  "era"
            case .P1: ending = "??ramos"
            case .P2: ending = "erais"
            case .P3: ending = "eran"
            }
            morph.verbForm = morph.verbForm + ending + preposition
            morph.comment = "Add the ending -> " + ending + preposition
            workingMorphStruct.append(morphStep: morph)

        case .imperfectSubjunctiveSE:
             morph.verbForm = "estuvieron"
            morph.comment = "Start with ellos-form estuvieron"

            workingMorphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "estuvie__"
            morph.comment = "Remove the ending 'ron', leaving 'estuvie...'"

            workingMorphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "estuvi"
            morph.isFinalStep = true
            switch person{
            case .S1: ending = "ese"
            case .S2: ending = "eses"
            case .S3: ending =  "ese"
            case .P1: ending = "??semos"
            case .P2: ending = "eseis"
            case .P3: ending = "esen"
            }
            morph.verbForm = morph.verbForm + ending + preposition
            morph.comment = "Add the ending -> " + ending + preposition
            workingMorphStruct.append(morphStep: morph)
        default:
           break
        }
        return workingMorphStruct
    }//getFormEstar

    public func getFormSaber(inputMorphStruct : MorphStruct, preposition : String, tense: Tense, person: Person ) -> MorphStruct
    {
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        var ending : String
        var ss = ""
        morph = MorphStep()
        morph.isIrregular = true
        switch (tense){
        case .present:
            switch person{
            case .S1:
                ss = "s??"
                morph.isFinalStep = true
                morph.comment = "Replace with " + morph.verbForm
                morph.verbForm = ss + preposition
                morphStruct.append(morphStep: morph)
                return morphStruct
            default:
               return morphStruct
            }
            
        case  .preterite:
            morph.verbForm = "sup_"
            morph.comment = "Replace with irregular stem " + "sup_"
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "sup"
            morph.isFinalStep = true
            
            switch person{
            case .S1:  ending = "e"
            case .S2:  ending =  "iste"
            case .S3:  ending = "o"
            case .P1:  ending = "imos"
            case .P2:  ending = "isteis"
            case .P3:  ending = "ieron"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add the ending -> " + ending
            morphStruct.append(morphStep: morph)
        case .conditional :
            morph.verbForm = "sabr_"
            morph.comment = "Replace with irregular stem " + "sabr_"
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "sabr"
            morph.isFinalStep = true
            
            switch person{
            case .S1:  ending = "??a"
            case .S2:  ending = "??as"
            case .S3:  ending = "??a"
            case .P1:  ending = "??amos"
            case .P2:  ending = "??ais"
            case .P3:  ending = "??an"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add the ending -> " + ending
            morphStruct.append(morphStep: morph)
        case .future :
            morph.verbForm = "sabr_"
            morph.comment = "Replace with irregular stem " + "sabr_"
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "sabr"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "??"
            case .S2:  ending = "??s"
            case .S3:  ending = "??"
            case .P1:  ending = "emos"
            case .P2:  ending = "??is"
            case .P3:  ending = "??n"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Append ending " + ending
            morphStruct.append(morphStep: morph)
        case .presentSubjunctive:
            morph.verbForm = "sep_" + preposition
            morph.comment = "Replace with irregular stem " +  "sep_" + preposition
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "sep"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "a"
            case .S2:  ending =  "as"
            case .S3:  ending =  "a"
            case .P1:  ending = "amos"
            case .P2:  ending =  "??is"
            case .P3:  ending =  "an"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add the ending -> " + ending
            morphStruct.append(morphStep: morph)
        
        default:
            return morphStruct
        }
        
        return morphStruct
    }//getFormSaber
    
    public func getFormHaber(inputMorphStruct : MorphStruct, preposition : String, tense: Tense, person: Person ) -> MorphStruct
    {
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        var ending : String
        var ss = ""
        morph = MorphStep()
        morph.isIrregular = true
        switch (tense){
        case .present:
//            morph = MorphStep()
            morph.isFinalStep = true
            switch person{
            case .S1:  ss = "he"
            case .S2:  ss =  "has"
            case .S3:  ss =  "ha"
            case .P1:  ss =  "hemos"
            case .P2:  ss =  "hab??is"
            case .P3:  ss =  "han"
            }
            morph.comment = "Replace with the irregular form " + morph.verbForm
            morph.verbForm = ss + preposition
            morphStruct.append(morphStep: morph)
            
            case  .preterite:
            morph.verbForm = "hub_"
            morph.comment = "Replace with irregular stem -> hub_"
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "hub"
            morph.isFinalStep = true
            
            switch person{
            case .S1:  ending = "e"
            case .S2:  ending =  "iste"
            case .S3:  ending = "o"
            case .P1:  ending = "imos"
            case .P2:  ending = "isteis"
            case .P3:  ending = "ieron"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add the ending -> " + ending + preposition
            morphStruct.append(morphStep: morph)
        case .presentSubjunctive:
            morph.verbForm = "hay_" + preposition
            morph.comment = "Replace with irregular stem "  + "hay_" + preposition
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "hay"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "a"
            case .S2:  ending =  "as"
            case .S3:  ending =  "a"
            case .P1:  ending = "amos"
            case .P2:  ending =  "??is"
            case .P3:  ending =  "an"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add the ending -> " + ending + preposition
            morphStruct.append(morphStep: morph)
        
        default:
            return morphStruct
        }
        
        return morphStruct
    }//getFormHaber
    

    public  func getFormSer(inputMorphStruct : MorphStruct, preposition : String, tense: Tense, person: Person ) -> MorphStruct
    {
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        var ending : String
        var ss = ""
        morph = MorphStep()
        morph.isIrregular = true
        switch (tense){
        case .present:
             morph.isFinalStep = true
            switch person{
            case .S1:  ss = "soy"
            case .S2:  ss =  "eres"
            case .S3:  ss =  "es"
            case .P1:  ss =  "somos"
            case .P2:  ss =  "sois"
            case .P3:  ss =  "son"
            }
            morph.comment = "Replace with the irregular form " + morph.verbForm
            morph.verbForm = ss + preposition
            morphStruct.append(morphStep: morph)
            
        case .imperfect :
            ss = "er_"
            morph.comment = "Replace with irregular stem " +  "er_"
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "er"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "a"
            case .S2:  ending = "as"
            case .S3:  ending = "a"
            case .P1:  ending = "amos"
            case .P2:  ending = "ais"
            case .P3:  ending = "an"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add the ending -> " + ending
            morphStruct.append(morphStep: morph)
        case  .preterite:
            morph.verbForm = "fu_"
            morph.comment = "Replace with irregular stem " + "fu_"
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "fu"
            morph.isFinalStep = true
            
            switch person{
            case .S1:  ending = "i"
            case .S2:  ending =  "iste"
            case .S3:  ending = "e"
            case .P1:  ending = "imos"
            case .P2:  ending = "isteis"
            case .P3:  ending = "eron"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add the ending -> " + ending + preposition
            morphStruct.append(morphStep: morph)
        case .presentSubjunctive:
            morph.verbForm = "se_" + preposition
            morph.comment = "Replace with irregular stem " + "se_" + preposition
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "se"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "a"
            case .S2:  ending =  "as"
            case .S3:  ending =  "a"
            case .P1:  ending = "amos"
            case .P2:  ending =  "??is"
            case .P3:  ending =  "an"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add the ending -> " + ending
            morphStruct.append(morphStep: morph)
        case .imperfectSubjunctiveRA:
             morph.verbForm = "fu___" + preposition
            morphStruct.append(morphStep: morph)
            morph.comment = "Replace with irregular stem " + morph.verbForm + preposition
            morph = MorphStep()
            morph.verbForm = "fu"
            morph.isFinalStep = true
            
            switch person{
            case .S1:  ending = "era"
            case .S2:  ending =  "eras"
            case .S3:  ending = "era"
            case .P1:  ending =  "??ramos"
            case .P2:  ending = "erais"
            case .P3:  ending =  "eran"
            }
            morph.verbForm = morph.verbForm + ending + preposition
            morph.comment = "Add the ending -> " + ending
            morphStruct.append(morphStep: morph)
        case  .imperfectSubjunctiveSE:
             morph.verbForm = "fu___" + preposition
            morph.comment = "Replace with irregular stem " + morph.verbForm + preposition
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "fu"
            morph.isFinalStep = true
            
            switch person{
            case .S1:  ending =  "ese"
            case .S2:  ending = "eses"
            case .S3:  ending =  "ese"
            case .P1:  ending = "??semos"
            case .P2:  ending = "eseis"
            case .P3:  ending = "esen"
            }
            morph.verbForm = morph.verbForm + ending + preposition
            morph.comment = "Add the ending -> " + ending
            morphStruct.append(morphStep: morph)
            
        default:
            return morphStruct
        }
        
        return morphStruct
    }//getFormSer
    
    
    public func getFormIr (inputMorphStruct : MorphStruct, preposition : String, tense: Tense, person: Person ) -> MorphStruct {
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        var verbForm : String
        var ending : String
        morph = MorphStep()
        morph.isIrregular = true
        switch (tense){
        case .present:
            morph.isFinalStep = true
            switch person{
            case .S1:  verbForm = "voy"
            case .S2:  verbForm = "vas"
            case .S3:  verbForm = "va"
            case .P1:  verbForm = "vamos"
            case .P2:  verbForm = "vas"
            case .P3: verbForm = "van"
            }
            morph.verbForm = verbForm  + preposition
            morph.comment = "Replace with irregular form " + verbForm + preposition
            morphStruct.append(morphStep: morph)
        case .imperfect:
            morph.verbForm = "ib_"
            morph.comment = "Replace with irregular stem " +  "ib_"
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "ib"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "a"
            case .S2:  ending = "as"
            case .S3:  ending =  "a"
            case .P1:  ending = "amos"
            case .P2:  ending = "ais"
            case .P3:  ending =  "an"
            }
            morph.verbForm = morph.verbForm + ending + preposition
            morph.comment = "Add the ending -> " + ending + preposition
            morphStruct.append(morphStep: morph)
        case .preterite:
            switch person{
            case .S1:  verbForm =  "fui"
            case .S2:  verbForm = "fuiste"
            case .S3:  verbForm = "fue"
            case .P1:  verbForm = "fuimos"
            case .P2:  verbForm = "fuisteis"
            case .P3:  verbForm = "fueron"
            }
            morph.isFinalStep = true
            morph.verbForm = verbForm + preposition
            morph.comment = "Replace with the form -> " + verbForm + preposition
            morphStruct.append(morphStep: morph)
        case .presentSubjunctive:
            morph.verbForm = "vay_"
            morph.comment = "Replace with irregular stem " + "vay_"
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "vay"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "a"
            case .S2:  ending = "as"
            case .S3:  ending = "a"
            case .P1:  ending = "amos"
            case .P2:  ending = "ais"
            case .P3:  ending = "an"
            }
            morph.verbForm = morph.verbForm + ending + preposition
            morph.comment = "Add the ending -> " + ending + preposition
            morphStruct.append(morphStep: morph)
            
        case .imperfectSubjunctiveRA:
            morph.verbForm = "fu___" + preposition
            morphStruct.append(morphStep: morph)
            morph = MorphStep()
            morph.verbForm = "fu"
            morph.isFinalStep = true
            
            switch person{
            case .S1:  ending = "era"
            case .S2:  ending =  "eras"
            case .S3:  ending = "era"
            case .P1:  ending =  "??ramos"
            case .P2:  ending = "erais"
            case .P3:  ending =  "eran"
            }
            morph.verbForm = morph.verbForm + ending + preposition
            morph.comment = "Add the ending -> " + ending
            morphStruct.append(morphStep: morph)
        case  .imperfectSubjunctiveSE:
            morph.verbForm = "fu___" + preposition
            morph.comment = "Replace with irregular stem " +  morph.verbForm + preposition
            morphStruct.append(morphStep: morph)
            
            morph = MorphStep()
            morph.verbForm = "fu"
            morph.isFinalStep = true
            
            switch person{
            case .S1:  ending =  "ese"
            case .S2:  ending = "eses"
            case .S3:  ending =  "ese"
            case .P1:  ending = "??semos"
            case .P2:  ending = "eseis"
            case .P3:  ending = "esen"
            }
            morph.verbForm = morph.verbForm + ending + preposition
            morph.comment = "Add the ending -> " + ending + preposition
            morphStruct.append(morphStep: morph)
        case .presentParticiple:
            morph.isFinalStep = true
            morph.verbForm = "yendo"  + preposition
            morph.comment  = "Replace with irregular form " + "'yendo'" + preposition
            morphStruct.append(morphStep: morph)
            
        default:
            break
        }
        return morphStruct
    }//getFormIr

    
    public func getFormOir (inputMorphStruct : MorphStruct, preposition : String,  tense: Tense, person: Person ) -> MorphStruct {
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        morph = MorphStep()
        morph.isIrregular = true
        
        switch (tense){
        case .present:
            switch person{
            case .S1:
                morph.isFinalStep = true
                morph.verbForm = "oigo"  + preposition
                morph.comment = "Replace with the irregular form ->" + "oigo" + preposition
                morphStruct.append(morphStep: morph)
            case .S2:
                morph.verbForm = "oy"  + preposition
                morph.comment = "Replace the stem 'oi' with 'oy' "
                morphStruct.append(morphStep: morph)
                morph = MorphStep()
                morph.verbForm = "oyes"
                morph.isFinalStep = true
                morph.comment = "Append the ending -> 'es' "
                morphStruct.append(morphStep: morph)
            case .S3:
                morph.verbForm = "oy"  + preposition
                morph.comment = "Replace the stem 'oi' with 'oy' "
                morphStruct.append(morphStep: morph)
                morph = MorphStep()
                morph.verbForm = "oye" + preposition
                morph.isFinalStep = true
                morph.comment = "Append the ending 'e' "
                morphStruct.append(morphStep: morph)
            case .P1:
                morph.verbForm = "o??"  + preposition
                morph.comment = "Replace the stem 'oi' with 'o??' "
                morphStruct.append(morphStep: morph)
                morph = MorphStep()
                morph.verbForm = "o??mos" + preposition
                morph.isFinalStep = true
                morph.comment = "Append the ending 'mos' "
                morphStruct.append(morphStep: morph)
            case .P2:
                morph.verbForm = "o??"  + preposition
                morph.comment = "Replace the stem 'oi' with 'o??' "
                morphStruct.append(morphStep: morph)
                morph = MorphStep()
                morph.verbForm = "o??s" + preposition
                morph.isFinalStep = true
                morph.comment = "Append the ending 's' "
                morphStruct.append(morphStep: morph)
            case .P3:
                morph.verbForm = "oy"  + preposition
                morph.comment = "Replace the stem 'oi' with 'oy' "
                morphStruct.append(morphStep: morph)
                morph = MorphStep()
                morph.verbForm = "oyen" + preposition
                morph.isFinalStep = true
                morph.comment = "Append the ending 'en' "
                morphStruct.append(morphStep: morph)
            }
        case .presentSubjunctive:
            morph.isFinalStep = true
            switch person{
            case .S1:
                morph.verbForm = "oiga"  + preposition
                morph.comment = "Replace with irregular form " + "oiga" + preposition
                morphStruct.append(morphStep: morph)
            case .S2:
                morph.verbForm = "oigas"  + preposition
                morph.comment = "Replace with irregular form " + "oigas" + preposition
                morphStruct.append(morphStep: morph)
            case .S3:
                morph.verbForm = "oiga"  + preposition
                morph.comment = "Replace with irregular form " +  "oiga" + preposition
                morphStruct.append(morphStep: morph)
            case .P1:
                morph.verbForm = "oigamos"  + preposition
                morph.comment = "Replace with irregular form " + "oigamos" + preposition
                morphStruct.append(morphStep: morph)
            case .P2:
                morph.verbForm = "oigais"  + preposition
                morph.comment = "Replace with irregular form " + "oig??is" + preposition
                morphStruct.append(morphStep: morph)
            case .P3:
                morph.verbForm = "oigan"  + preposition
                morph.comment = "Replace with irregular form " + "oigan" + preposition
                morphStruct.append(morphStep: morph)
            }

        case .preterite:
            morph.isFinalStep = true
            switch person{
            case .S1:
                morph.verbForm = "o??"  + preposition
                morph.comment = "Replace with irregular form " +  "o??" + preposition
                morphStruct.append(morphStep: morph)
            case .S2:
                morph.verbForm = "o??ste"  + preposition
                morph.comment = "Replace with irregular form " + "o??ste" + preposition
                morphStruct.append(morphStep: morph)
            case .S3:
                morph.verbForm = "oy??"  + preposition
                morph.comment = "Replace with irregular form " +  "oy??" + preposition
                morphStruct.append(morphStep: morph)
            case .P1:
                morph.verbForm = "o??mos"  + preposition
                morph.comment = "Replace with irregular form " + "o??mos" + preposition
                morphStruct.append(morphStep: morph)
            case .P2:
                morph.verbForm = "o??steis"  + preposition
                morph.comment = "Replace with irregular form " + "o??steis" + preposition
                morphStruct.append(morphStep: morph)
            case .P3:
                morph.verbForm = "oyeron"  + preposition
                morph.comment = "Replace with irregular form " + "oyeron" + preposition
                morphStruct.append(morphStep: morph)
            }
        case .conditional :
            morph.comment = "Replace 'o??r' with unaccented 'oir' "
            morphStruct.append(morphStep: morph)
            var ending = ""
            morph = MorphStep()
            morph.verbForm = "oir"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "??a"
            case .S2:  ending = "??as"
            case .S3:  ending = "??a"
            case .P1:  ending = "??amos"
            case .P2:  ending = "??ais"
            case .P3:  ending = "??an"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add the ending -> " + ending
            morphStruct.append(morphStep: morph)
        case .future :
            morph.comment = "Replace 'o??r' with unaccented 'oir' "
            morphStruct.append(morphStep: morph)
            var ending = ""
            morph = MorphStep()
            morph.verbForm = "oir"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "??"
            case .S2:  ending = "??s"
            case .S3:  ending = "??"
            case .P1:  ending = "emos"
            case .P2:  ending = "??is"
            case .P3:  ending = "??n"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add the ending -> " + ending
            morphStruct.append(morphStep: morph)
        case .presentParticiple:
            morph.verbForm = "oyendo"  + preposition
            morph.isFinalStep = true
            morph.comment = "Replace with irregular form " + "oyendo" + preposition
            morphStruct.append(morphStep: morph)
        case .pastParticiple:
            morph.verbForm = "oido"  + preposition
            morph.isFinalStep = true
            morph.comment = "Replace with irregular form " + "oido" + preposition
            morphStruct.append(morphStep: morph)
        default:
            break
        }
        return morphStruct
    }
    /*
     ??
     ??
     ??
     ??
     ??
     ????
     ??
     ??
     ??
     */
    public func getFormReir (inputMorphStruct : MorphStruct, preposition : String,  tense: Tense, person: Person ) -> MorphStruct {
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        morph = MorphStep()
        morph.isIrregular = true
        switch (tense){
        case .present:
            morph.isFinalStep = true
            switch person{
            case .S1:
                morph.verbForm = "r??o"  + preposition
                morph.comment = "Replace with irregular form " +  "r??o" + preposition
                morphStruct.append(morphStep: morph)
            case .S2:
                morph.verbForm = "r??es"  + preposition
                morph.comment = "Replace with irregular form " + "r??es" + preposition
                morphStruct.append(morphStep: morph)
            case .S3:
                morph.verbForm = "r??e"  + preposition
                morph.comment = "Replace with irregular form " + "r??e" + preposition
                morphStruct.append(morphStep: morph)
            case .P1:
                morph.verbForm = "re??mos"  + preposition
                morph.comment = "Replace with irregular form " + "re??mos" + preposition
                morphStruct.append(morphStep: morph)
            case .P2:
                morph.verbForm = "re??s"  + preposition
                morph.comment = "Replace with irregular form " + "re??s" + preposition
                morphStruct.append(morphStep: morph)
            case .P3:
                morph.verbForm = "r??en"  + preposition
                morph.comment = "Replace with irregular form " + "r??en" + preposition
                morphStruct.append(morphStep: morph)
            }
        case .preterite:
            switch person{
            case .S2:
                morph.verbForm = "re??ste"  + preposition
                morph.comment = "Replace with irregular form " + "r??es" + preposition
                morphStruct.append(morphStep: morph)
            case .S3:
                morph.isFinalStep = true
                morph.verbForm = "ri??"  + preposition
                morph.comment = "Replace with irregular form " + "ri??" + preposition
                morphStruct.append(morphStep: morph)
            case .P1:
                morph.verbForm = "re??mos"  + preposition
                morph.comment = "Replace with irregular form " + "re??mos" + preposition
                morphStruct.append(morphStep: morph)
            case .P2:
                morph.verbForm = "re??steis"  + preposition
                morph.comment = "Replace with irregular form " + "re??steis" + preposition
                morphStruct.append(morphStep: morph)
            case .P3:
                morph.isFinalStep = true
                morph.verbForm = "rieron"  + preposition
                morph.comment = "Replace with irregular form " + "rieron" + preposition
                morphStruct.append(morphStep: morph)
            default:
                break
            }
        case .conditional :
            morph.comment = "Replace 're??r' with unaccented 'reir' "
            morphStruct.append(morphStep: morph)
            var ending = ""
            morph = MorphStep()
            morph.verbForm = "reir"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "??a"
            case .S2:  ending = "??as"
            case .S3:  ending = "??a"
            case .P1:  ending = "??amos"
            case .P2:  ending = "??ais"
            case .P3:  ending = "??an"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add ending -> " + ending
            morphStruct.append(morphStep: morph)
        case .future:
            morph.comment = "Replace 're??r' with unaccented 'reir' "
            morphStruct.append(morphStep: morph)
            var ending = ""
            morph = MorphStep()
            morph.verbForm = "reir"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "??"
            case .S2:  ending = "??s"
            case .S3:  ending = "??"
            case .P1:  ending = "emos"
            case .P2:  ending = "??is"
            case .P3:  ending = "??n"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add ending " + ending
            morphStruct.append(morphStep: morph)
        case .presentSubjunctive :
            morph.isFinalStep = true
            switch person{
            case .S1:
                morph.verbForm = "r??a"  + preposition
                morph.comment = "Replace with irregular form " +  "r??a" + preposition
                morphStruct.append(morphStep: morph)
            case .S2:
                morph.verbForm = "r??as"  + preposition
                morph.comment = "Replace with irregular form " + "r??as" + preposition
                morphStruct.append(morphStep: morph)
            case .S3:
                morph.verbForm = "r??a"  + preposition
                morph.comment = "Replace with irregular form " + "r??a" + preposition
                morphStruct.append(morphStep: morph)
            case .P1:
                morph.verbForm = "riamos"  + preposition
                morph.comment = "Replace with irregular form " + "riamos" + preposition
                morphStruct.append(morphStep: morph)
            case .P2:
                morph.verbForm = "ri??is"  + preposition
                morph.comment = "Replace with irregular form " + "ri??is" + preposition
                morphStruct.append(morphStep: morph)
            case .P3:
                morph.verbForm = "r??an"  + preposition
                morph.comment = "Replace with irregular form " + "r??an" + preposition
                morphStruct.append(morphStep: morph)      
            }
        case .presentParticiple:
            morph.isFinalStep = true
            morph.verbForm = "riendo"  + preposition
            morph.comment = "Replace with irregular form " + "riendo" + preposition
            morphStruct.append(morphStep: morph)
        case .pastParticiple:
            morph.isFinalStep = true
            morph.verbForm = "reido"  + preposition
            morph.comment = "Replace with irregular form " + "reido" + preposition
            morphStruct.append(morphStep: morph)
        default:
            break
        }

        return morphStruct
    }

    public func getFormSonreir (inputMorphStruct : MorphStruct, preposition : String,  tense: Tense, person: Person ) -> MorphStruct {
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        morph = MorphStep()
        morph.isIrregular = true
        
        switch (tense){
        case .present:
            morph.comment = "Remove 3-letter ending sonr___ "
            morph.verbForm = "sonr__"
            morphStruct.append(morphStep: morph)
            var ending = ""
            morph = MorphStep()
            morph.verbForm = "sonr"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "??o"
            case .S2:  ending = "??es"
            case .S3:  ending = "??e"
            case .P1:  ending = "e??mos"
            case .P2:  ending = "e??s"
            case .P3:  ending = "??en"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add the ending -> " + ending
            morphStruct.append(morphStep: morph)
        case .presentSubjunctive:
            morph.comment = "Remove 3-letter ending sonr___ "
            morph.verbForm = "sonr__"
            morphStruct.append(morphStep: morph)
            var ending = ""
            morph = MorphStep()
            morph.verbForm = "sonr"
            morph.isFinalStep = true
            switch person{
            case .P1:  ending = "iamos"
                morph.verbForm = morph.verbForm + ending
                morph.verbForm += preposition
                morph.comment = "Add the ending -> " + ending
                morphStruct.append(morphStep: morph)
            case .P2:  ending = "i??is"
                morph.verbForm = morph.verbForm + ending
                morph.verbForm += preposition
                morph.comment = "Add the ending -> " + ending
                morphStruct.append(morphStep: morph)
            default:
                break
            }
            
        case .preterite:
            morph.comment = "Remove 3-letter ending sonr___ "
            morph.verbForm = "sonr__"
            morphStruct.append(morphStep: morph)
            var ending = ""
            morph = MorphStep()
            morph.verbForm = "sonr"
            morph.isFinalStep = true
            switch person{
            case .S1:  ending = "e??"
            case .S2:  ending = "e??ste"
            case .S3:  ending = "i??"
            case .P1:  ending = "e??mos"
            case .P2:  ending = "e??stes"
            case .P3:  ending = "ieron"
            }
            morph.verbForm = morph.verbForm + ending
            morph.verbForm += preposition
            morph.comment = "Add the ending " + ending
            morphStruct.append(morphStep: morph)
        case .presentParticiple:
            morph.isFinalStep = true
            morph.verbForm = "riendo"  + preposition
            morph.comment = "Replace with irregular form " +  "soriendo" + preposition
            morphStruct.append(morphStep: morph)
        case .pastParticiple:
            morph.isFinalStep = true
            morph.verbForm = "sonre??do"  + preposition
            morph.comment = "Replace with irregular form " + "sonre??do" + preposition
            morphStruct.append(morphStep: morph)
        default:
            break
        }

        return morphStruct
    }



    public func getFormVer (inputMorphStruct : MorphStruct, preposition : String, tense: Tense, person: Person ) -> MorphStruct {
        var morphStruct = inputMorphStruct
        var morph : MorphStep
        morph = MorphStep()
        morph.isIrregular = true
        var verbForm = inputMorphStruct.finalVerbForm()
        var ending : String
        switch (tense){
        case .present:
            morph.isFinalStep = true
            switch person{
            case .S1:  verbForm = "veo"
                morph.verbForm = verbForm  + preposition
                morph.comment = "Replace with the form -> " + verbForm + preposition
                morphStruct.append(morphStep: morph)
            case .P2:  verbForm = "veis"
                morph.verbForm = verbForm  + preposition
                morph.comment = "Replace with the form -> " + verbForm + preposition
                morphStruct.append(morphStep: morph)
            default: break
            }
            
        case .presentSubjunctive:
            morph.isFinalStep = true
            switch person{
            case .S1:  verbForm = "vea"
            case .S2:  verbForm = "veas"
            case .S3:  verbForm = "vea"
            case .P1:  verbForm = "veamos"
            case .P2:  verbForm = "ve??is"
            case .P3:  verbForm = "vean"
            }
            morph.verbForm = verbForm  + preposition
            morph.comment = "Replace with the form -> " + verbForm + preposition
            morphStruct.append(morphStep: morph)
        case .preterite:
            morph.isFinalStep = true
            switch person{
            case .S1:  verbForm =  "vi"
            case .S2:  verbForm = "viste"
            case .S3:  verbForm = "vio"
            case .P1:  verbForm = "vimos"
            case .P2:  verbForm = "visteis"
            case .P3:  verbForm = "vieron"
            }
            morph.verbForm = verbForm + preposition
            morph.comment = "Replace with the form -> " + verbForm + preposition
            morphStruct.append(morphStep: morph)
              
        case .imperfect:
            morph.isFinalStep = true
            morph.verbForm = "ve"
            switch person{
            case .S1:  ending = "??a"
            case .S2:  ending = "??as"
            case .S3:  ending = "??a"
            case .P1:  ending = "??amos"
            case .P2:  ending = "??ais"
            case .P3:  ending = "??an"
            }
            morph.verbForm = morph.verbForm + ending + preposition
            morph.comment = "Replace with the form -> " + ending + preposition
            morphStruct.append(morphStep: morph)
        case .presentParticiple:
            morph.isFinalStep = true
            morph.verbForm = "viendo"  + preposition
            morph.comment = "Replace with the form -> " + "viendo" + preposition
            morphStruct.append(morphStep: morph)
            
        case .pastParticiple:
            morph.isFinalStep = true
            morph.verbForm = "visto"  + preposition
            morph.comment = "Replace with the form -> " + "visto" + preposition
            morphStruct.append(morphStep: morph)
            
        default:
            break
        }
        return morphStruct
    }

    

}
