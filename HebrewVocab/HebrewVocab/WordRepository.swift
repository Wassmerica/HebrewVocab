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
    
    //comment test to get rid Sourcetree password issue
    fileprivate static var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    class func getNextSetOfWords() -> Array<HWord>? {
        let defaults = UserDefaults.standard
        let nextSet = defaults.integer(forKey: "currentGroup") + 1
        
        if nextSet > defaults.integer(forKey: "maxWordsGroup") {
            //no more sets of words - go back to 0
            defaults.set(0, forKey: "currentGroup")
            return fetchWordsByGroup(0)
        } else {
            defaults.set(nextSet, forKey: "currentGroup")
            return fetchWordsByGroup(nextSet)
        }
    }
    
    class func getLastSetOfWords() -> Array<HWord>? {
        let defaults = UserDefaults.standard
        let lastSet = defaults.integer(forKey: "currentGroup") - 1
        
        if lastSet < 0 {
            //we are at 0
            defaults.set(0, forKey: "currentGroup")
            return fetchWordsByGroup(0)
        } else {
            defaults.set(lastSet, forKey: "currentGroup")
            return fetchWordsByGroup(lastSet)
        }
    }
    
    class func getCurrentSetOfWords() -> Array<HWord> {
        let defaults = UserDefaults.standard
        if defaults.integer(forKey: "currentGroup") > 0 {
            return fetchWordsByGroup(defaults.integer(forKey: "currentGroup"))
            
        } else {
            return fetchWordsByGroup(0)
        }
    }
    
    fileprivate class func fetchWordsByGroup(_ group:Int) -> Array<HWord> {
        let fetchRequest       = NSFetchRequest<NSFetchRequestResult>(entityName: "HWord")
        var arrayOfWords:Array = Array<HWord>()
    
        let pred = NSPredicate(format: "group = %D", group)
        fetchRequest.predicate = pred
        
        do {
            let objects = try managedObjectContext.fetch(fetchRequest) as? [HWord]
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
    
}
