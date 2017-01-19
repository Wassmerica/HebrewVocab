//
//  PhraseRepository.swift
//  HebrewVocab
//
//  Created by Michael Wasserman on 2016-06-11.
//  Copyright © 2016 michael wasserman. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class PhraseRepository {
    
    fileprivate static var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    class func getNextSetOfPhrases() -> Array<HPhrase>? {
        let defaults = UserDefaults.standard
        let nextSet = defaults.integer(forKey: "currentGroupPhrase") + 1
        
        if nextSet > defaults.integer(forKey: "maxPhrasesGroup") {
            //no more sets of words - go back to 0
            defaults.set(0, forKey: "currentGroupPhrase")
            return fetchPhrasesByGroup(0)
        } else {
            defaults.set(nextSet, forKey: "currentGroupPhrase")
            return fetchPhrasesByGroup(nextSet)
        }
    }
    
    class func getLastSetOfPhrases() -> Array<HPhrase>? {
        let defaults = UserDefaults.standard
        let lastSet = defaults.integer(forKey: "currentGroupPhrase") - 1
        
        if lastSet < 0 {
            //we are at 0
            defaults.set(0, forKey: "currentGroupPhrase")
            return fetchPhrasesByGroup(0)
        } else {
            defaults.set(lastSet, forKey: "currentGroupPhrase")
            return fetchPhrasesByGroup(lastSet)
        }
    }
    
    class func getCurrentSetOfPhrases() -> Array<HPhrase> {
        let defaults = UserDefaults.standard
        if defaults.integer(forKey: "currentGroupPhrase") > 0 {
            return fetchPhrasesByGroup(defaults.integer(forKey: "currentGroupPhrase"))
            
        } else {
            return fetchPhrasesByGroup(0)
        }
    }
    
    fileprivate class func fetchPhrasesByGroup(_ group:Int) -> Array<HPhrase> {
        let fetchRequest       = NSFetchRequest<NSFetchRequestResult>(entityName: "HPhrase")
        var arrayOfPhrases:Array = Array<HPhrase>()
        
        let pred = NSPredicate(format: "group = %D", group)
        fetchRequest.predicate = pred
        
        do {
            let objects = try managedObjectContext.fetch(fetchRequest) as? [HPhrase]
            if let results = objects {
                if results.count > 0 {
                    for phrase in results {
                        arrayOfPhrases.append(phrase)
                    }
                }
            }
            
        } catch {
            print("error retreiving phrases: \(error)")
        }
        return arrayOfPhrases
    }
}
