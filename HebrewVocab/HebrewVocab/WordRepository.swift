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
        let defaults = NSUserDefaults.standardUserDefaults()
        if defaults.integerForKey("currentGroup") > 0 {
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
    
}