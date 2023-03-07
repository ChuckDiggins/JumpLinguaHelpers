////
////  JSONUtilities.swift
////  ContextFree
////
////  Created by Charles Diggins on 2/20/22.
////
//
//import Foundation
//
//public func getJsonWord(word: Word)->JSONWord{
//    return JSONWord(spanish: word.spanish, english: word.english, french: word.french, wordType: getStringFromWordType(wordType: word.wordType))
//}
//
//public func getJsonWordCollectionStructFromWordCollection(wordCollection: dWordCollection)->JSONCollectionStruct{
//    var jwc = JSONCollectionStruct(collectionName: wordCollection.collectionName)
//    for word in wordCollection.wordList{
//        jwc.appendJsonWord(jw: getJsonWord(word: word))
//    }
//    return jwc
//}
