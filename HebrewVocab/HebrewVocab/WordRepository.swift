//
//  WordRepository.swift
//  HebrewVocab
//
//  Created by michael wasserman on 2016-05-30.
//  Copyright © 2016 michael wasserman. All rights reserved.
//

import Foundation

class WordRepository {
    
    private var wordSet = Array<HWord>()
    
    init() {
        loadWords()
    }
    
    func getAllWords() -> Array<HWord> {
        return wordSet
    }
    
    /*
    func getNextSetOfWords() -> Array<HWord> {
        //check NSUserDefaults for start index of next set
        //if it's not there start at 1
    }
    */
    
    private func loadWords() {
        let w1 = HWord(num: 1, heb: "\u{05E8}\u{05B7}\u{05E7}", eng: "only")
        wordSet.append(w1)
        
        let w2 = HWord(num: 2, heb: HChar.Qof + HChar.Patah + HChar.Het, eng: "take")
        wordSet.append(w2)

    }
    
}