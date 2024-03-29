//
//  VerbModelConjugation.swift
//  VIperSpanish 2
//
//  Created by Charles Diggins on 3/11/21.
//

import Foundation

public enum VerbModelMode{
    case algorithm, json, both
}

public class VerbModelConjugation {
    var currentLanguage : LanguageType
    public init(currentLanguage : LanguageType){
        self.currentLanguage = currentLanguage
    }
}

public class RomanceVerbModelConjugation : VerbModelConjugation {
    public init(language: LanguageType){
        super.init(currentLanguage: language)
    }
    
    public var m_jsonVerbModelManager = JsonVerbModelManager()
    var verbModels = [RomanceVerbModel]()
    
    
    public func setLanguage(language: LanguageType){
        currentLanguage = language
        m_jsonVerbModelManager.setLanguage(language: currentLanguage)
    }
    
    public func loadVerbModels(){
        if verbModels.count == 0 {
            createVerbModels(mode: .algorithm)
            //listVerbModels()
        }
    }
    
    public func createVerbModels(mode: VerbModelMode){
        if verbModels.count > 0 {return}
        
        switch (mode){
        case .algorithm:
            createVerbModelsUsingAlgorithm()
            saveVerbModelsToJson()
        case .json:
            createVerbModelsFromJson()
        case .both:
            createVerbModelsUsingAlgorithm()
            saveVerbModelsToJson()
            createVerbModelsFromJson()
        }
    }
    
    
    public func createVerbModelsUsingAlgorithm(){
        switch currentLanguage {
        case .Spanish:
            verbModels = createSpanishVerbModels()
//            print("Spanish verb model count = \(verbModels.count)")
        case .French:
            verbModels = createFrenchVerbModels()
//            print(verbModels[3])
//            print("French verb model count = \(verbModels.count)")
        default:
            break
        }
    }
    
    public func saveVerbModelsToJson(){
        m_jsonVerbModelManager.clearVerbModels()
        
        for i in 0 ..< verbModels.count {
            let vm = verbModels[i]
            //convert to JsonVerbModel
            let jvm = JsonVerbModel(rvm: vm)
            if ( vm.id == 555){
                jvm.printThyself()
            }
            //then append and encode
            m_jsonVerbModelManager.appendVerbModel(verbModel: jvm)
        }
//        if false {
//            print("for \(currentLanguage) - json verb model dictionary count = \(m_jsonVerbModelManager.getVerbModelCount()) ... verbModels count = \(verbModels.count)")
//            let finalIndex = verbModels.count-1
//            let jsonFinalModelVerb = m_jsonVerbModelManager.getVerbModelAt(index: finalIndex).modelVerbString
//            let algFinalModelVerb = verbModels[finalIndex].modelVerb
//            print("final verb models.  Json: \(jsonFinalModelVerb) Algorithmic: \(algFinalModelVerb)")
//        }
    }
    
    public func createVerbModelsFromJson(){
        verbModels.removeAll()
        var rvm : RomanceVerbModel
        for i in 0 ..< m_jsonVerbModelManager.getVerbModelCount(){
            rvm = m_jsonVerbModelManager.getRomanceVerbModelAt(index: i)
            if ( rvm.id == 46 ){
                let jvm = m_jsonVerbModelManager.getVerbModelAt(index: i)
                jvm.printThyself()
            }
            verbModels.append(rvm)
            //print("createVerbModelsFromJson: index \(i), rvm \(rvm.modelVerb), jvm \(m_jsonVerbModelManager.getVerbModelAt(index: i).modelVerbString)")
        }
        
    }
    
    
    public  func test(){
        loadVerbModels()
        var vm = getVerbModel(verbWord: "avoir")
        let parseList = vm.parseVerbModel()
        print ("vm id = \(vm.id), modelVerb \(vm.modelVerb) ... exceptionListCount \(vm.exceptionList.count) ... parsedStruct pattern \(parseList[0].pattern)")
        for ps in parseList {
            print ("pattern = \(ps.pattern), from \(ps.from), to \(ps.to), tense = \(ps.tense) ... persons \(ps.personList)")
        }
    }

    public func getVerbModelAtModelId(targetID: Int)->RomanceVerbModel{
        loadVerbModels()
        let nullVerbModel = RomanceVerbModel(id: -1, modelVerb: "")
        let vmCount = verbModels.count
        for i in 0 ..< vmCount {
            let vm = verbModels[i]
            if vm.id == targetID {
                //print("VerbWord \(verbWord) has verb model \(vm.id) - model verb \(vm.modelVerb)")
                return vm
            }
        }

        return nullVerbModel
    }
    public func getVerbModelAtModelVerb(targetVerb: String)->RomanceVerbModel{
        loadVerbModels()
        let nullVerbModel = RomanceVerbModel(id: -1, modelVerb: "")
        let vmCount = verbModels.count
        for i in 0 ..< vmCount {
            let vm = verbModels[i]
            if vm.modelVerb == targetVerb {
                //print("VerbWord \(verbWord) has verb model \(vm.id) - model verb \(vm.modelVerb)")
                return vm
            }
        }
        return nullVerbModel
    }
    public func getVerbModel(verbWord: String)->RomanceVerbModel{
        loadVerbModels()
        let nullVerbModel = RomanceVerbModel(id: -1, modelVerb: "")
        let vmCount = verbModels.count
        for i in 0 ..< vmCount {
            let vm = verbModels[i]
//            if vm.modelVerb == "ver" && verbWord == "rever"{
//                print ("getVerbModel \(vm.modelVerb)")
//            }
            if vm.isModelFor(verbWord: verbWord){
                //print("VerbWord \(verbWord) has verb model \(vm.id) - model verb \(vm.modelVerb)")
                return vm
            }
        }

        return nullVerbModel
    }
    public func getVerbModel(language: LanguageType, verbWord: String)->RomanceVerbModel{
        setLanguage(language: language)
        loadVerbModels()
        let nullVerbModel = RomanceVerbModel(id: -1, modelVerb: "")
        let vmCount = verbModels.count
        for i in 0 ..< vmCount {
            let vm = verbModels[i]
//            if vm.modelVerb == "ver" && verbWord == "rever"{
//                print ("getVerbModel \(vm.modelVerb)")
//            }
            if vm.isModelFor(verbWord: verbWord){
                //print("VerbWord \(verbWord) has verb model \(vm.id) - model verb \(vm.modelVerb)")
                return vm
            }
        }

        return nullVerbModel
    }
    
    public func listVerbModels(){
        var vmIndex = 0
        print("Start of model dump\n\n")
        for vm in verbModels {
            if ( vmIndex < 1000 ){
                dumpModel(index: vmIndex, vm: vm)
            }
            else {
                break
            }
            vmIndex += 1
        }
        print("End of model dump\n\n")

    }
    
    public func dumpModel(index: Int, vm : RomanceVerbModel){
        var verbModel = vm
        //var idNum = vm.id
        //var modelVerb = vm.modelVerb
        
        let parseList = verbModel.parseVerbModel()
        print ("\(index).  vm id = \(vm.id), modelVerb \(vm.modelVerb) ... exceptionListCount \(vm.exceptionList.count) ")
        if ( parseList.count > 0  ){
            for ps in parseList {
                print ("pattern = \(ps.pattern), from \(ps.from), to \(ps.to)")
            }
        }
    }
    
    public func getVerbModels()->[RomanceVerbModel]{
        verbModels
    }
    
    public func getVerbModelsWithVerbEnding(verbEnding: VerbEnding)->[RomanceVerbModel]{
        let vu = VerbUtilities()
        var rmvList = [RomanceVerbModel]()
        loadVerbModels()
        for vm in verbModels {
            switch currentLanguage {
            case .Spanish:
                let result = vu.analyzeSpanishWordPhrase(testString: vm.modelVerb)
                if result.verbEnding == verbEnding {rmvList.append(vm)}
            case .French:
                let result = vu.analyzeFrenchWordPhrase(phraseString: vm.modelVerb)
                if result.verbEnding == verbEnding {rmvList.append(vm)}
            default:
                break
            }
        }
        return rmvList
    }
    
    public func getVerbModelsThatHavePattern(inputPatternStruct: SpecialPatternStruct)->[RomanceVerbModel]{
        var rmvList = [RomanceVerbModel]()
        loadVerbModels()
        for vm in verbModels {
            var tempVm = vm
            let specialPatternList = tempVm.parseSpecialPatterns()
            for pattern in specialPatternList {
                if pattern.tense == inputPatternStruct.tense && pattern.pattern == inputPatternStruct.pattern {
                    rmvList.append(vm)
                }
            }
            
        }
        return rmvList
    }
    
    
    public func getVerbModelIDsThatHavePattern(inputPatternStruct: SpecialPatternStruct)->[Int]{
        var idList = [Int]()
        loadVerbModels()
        for vm in verbModels {
            var tempVm = vm
            let specialPatternList = tempVm.parseSpecialPatterns()
            for pattern in specialPatternList {
                if pattern.tense == inputPatternStruct.tense && pattern.pattern == inputPatternStruct.pattern {
                    idList.append(vm.id)
                }
            }
            
        }
        return idList
    }
    
}
