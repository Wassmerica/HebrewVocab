//
//  WordRepository.swift
//  HebrewVocab
//
//  Created by michael wasserman on 2016-05-30.
//  Copyright © 2016 michael wasserman. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class WordRepository {
    
    private static var managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    //private static var wordSet = Array<Array<HWord>>()
    
    class func getNextSetOfWords() -> Array<HWord>? {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let nextSet = defaults.integerForKey("currentGroup") + 1
        
        if nextSet > defaults.integerForKey("maxGroup") {
            //no more sets of words - go back to 0
            defaults.setInteger(0, forKey: "currentGroup")
            return fetchWordsByGroup(0)
        } else {
            defaults.setInteger(nextSet, forKey: "currentGroup")
            return fetchWordsByGroup(nextSet)
        }
    }
    
    class func getCurrentSetOfWords() -> Array<HWord> {
        //check NSUserDefaults for index of the current set
        //if it's not there start at first set
        //loadWords()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if defaults.integerForKey("currentGroup") > 0 {
            //return wordSet[defaults.integerForKey("currentSet")]
            return fetchWordsByGroup(defaults.integerForKey("currentGroup"))
            
        } else {
            return fetchWordsByGroup(0)
        }

    }

    
    private class func fetchWordsByGroup(group:Int) -> Array<HWord> {
        let fetchRequest       = NSFetchRequest(entityName: "HWord")
        var arrayOfWords:Array = Array<HWord>()
    
        let pred = NSPredicate(format: "group = %D", group)
        fetchRequest.predicate = pred
        
        do {
            let objects = try managedObjectContext.executeFetchRequest(fetchRequest) as? [HWord]
            if let results = objects {
                if results.count > 0 {
                    for word in results {
                        arrayOfWords.append(word)
                    }
                }
            }
            
        } catch {
            print("error retreiving words: \(error)")
        }
        return arrayOfWords
    }
    
    private class func loadWords() {
        //Set 1
        /*var setOne = Array<HWord>()
        let w1 = HWord(set: 1, heb: HChar.Tsadi + HChar.Qamats + HChar.He + HChar.HatefQamats + HChar.Resh + HChar.Patah + HChar.Yod + HChar.Hiriq + HChar.MemFinal, eng: "noon")
        setOne.append(w1)
        let w2 = HWord(set: 1, heb: HChar.Qof + HChar.Patah + HChar.Het, eng: "take")
        setOne.append(w2)
        let w3 = HWord(set: 1, heb: HChar.Aleph + HChar.HatefPatah + HChar.Resh + HChar.VavShuruq + HChar.Het + HChar.Patah + HChar.Tav + " " + HChar.Bet + HChar.VavHolam + HChar.Qof + HChar.Segol + HChar.Resh, eng: "breakfast")
        setOne.append(w3)
        let w4 = HWord(set: 1, heb: HChar.Het + HChar.VavHolam + HChar.Lamed + HChar.Segol + HChar.He, eng: "ill")
        setOne.append(w4)
        let w5 = HWord(set: 1, heb: HChar.Ayin + HChar.Patah + HChar.Kaf + HChar.Sheva + HChar.Shin + HChar.Qamats + HChar.Yod + HChar.Vav, eng: "now")
        setOne.append(w5)
        let w6 = HWord(set: 1, heb: HChar.Ayin + HChar.VavHolam + HChar.Vet + HChar.Tsere + HChar.Dalet, eng: "works")
        setOne.append(w6)
        wordSet.append(setOne)
        
        //Set 2
        var setTwo = Array<HWord>()
        let w7 = HWord(set: 2, heb: HChar.Shin + HChar.Patah + HChar.MemFinal, eng: "there")
        setTwo.append(w7)
        let w8 = HWord(set: 2, heb: HChar.Mem + HChar.Patah + HChar.He, eng: "what")
        setTwo.append(w8)
        let w9 = HWord(set: 2, heb: HChar.Gimel + HChar.Patah + HChar.MemFinal, eng: "also")
        setTwo.append(w9)
        let w10 = HWord(set: 2, heb: HChar.He + HChar.Hiriq + HChar.Nun + HChar.Tsere + HChar.He, eng: "here is")
        setTwo.append(w10)
        let w11 = HWord(set: 2, heb: HChar.Zayen + HChar.VavHolam + HChar.Het + HChar.Segol + HChar.Resh + HChar.Segol + HChar.Tav, eng: "remembers")
        setTwo.append(w11)
        let w12 = HWord(set: 2, heb: HChar.Pe + HChar.Qamats + HChar.Het + HChar.VavHolam + HChar.Tav, eng: "less")
        setTwo.append(w12)
        
        wordSet.append(setTwo)
        
        //Set 3
        var setThree = Array<HWord>()
        let w13 = HWord(set: 3, heb: HChar.Mem + HChar.Sheva + HChar.Dalet + HChar.Patah + HChar.Bet + HChar.Segol + HChar.Resh + HChar.Segol + HChar.Tav, eng: "speaks")
        setThree.append(w13)
        let w14 = HWord(set: 3, heb: HChar.Gimel + HChar.Sheva + HChar.Vet + HChar.Segol + HChar.Resh + HChar.Segol + HChar.Tav, eng: "lady")
        setThree.append(w14)
        let w15 = HWord(set: 3, heb: HChar.Bet + HChar.Hiriq + HChar.Shin + HChar.Sheva + HChar.Vet + HChar.Hiriq + HChar.Yod + HChar.Lamed, eng: "for")
        setThree.append(w15)
        let w16 = HWord(set: 3, heb: HChar.Mem + HChar.Hiriq + HChar.Kaf + HChar.Sheva + HChar.Nun + HChar.Qamats + HChar.Samekh + HChar.Patah + HChar.Yod + HChar.Hiriq + HChar.MemFinal, eng: "trousers")
        setThree.append(w16)
        let w17 = HWord(set: 3, heb: HChar.Nun + HChar.Patah + HChar.Ayin + HChar.Patah + HChar.Lamed, eng: "shoe")
        setThree.append(w17)
        let w18 = HWord(set: 3, heb: HChar.Resh + HChar.Segol + HChar.Gimel + HChar.Segol + HChar.Lamed, eng: "leg")
        setThree.append(w18)
        
        wordSet.append(setThree)*/
    }
    
}