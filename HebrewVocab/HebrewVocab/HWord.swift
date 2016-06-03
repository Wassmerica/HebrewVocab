//
//  HWord.swift
//  HebrewVocab
//
//  Created by michael wasserman on 2016-05-30.
//  Copyright © 2016 michael wasserman. All rights reserved.
//

import Foundation

class HWord {
    var wordSet:NSNumber?
    var hebrew:String?
    var english:String?
    
    init(set:NSNumber, heb:String, eng:String) {
        self.wordSet = set
        self.hebrew  = heb
        self.english = eng
    }
}