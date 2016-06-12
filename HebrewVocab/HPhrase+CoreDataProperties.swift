//
//  HPhrase+CoreDataProperties.swift
//  HebrewVocab
//
//  Created by Michael Wasserman on 2016-06-11.
//  Copyright © 2016 michael wasserman. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension HPhrase {

    @NSManaged var english: String?
    @NSManaged var group: NSNumber?
    @NSManaged var hebrew: String?

}
