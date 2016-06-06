//
//  HWord+CoreDataProperties.swift
//  HebrewVocab
//
//  Created by michael wasserman on 2016-06-05.
//  Copyright © 2016 michael wasserman. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension HWord {

    @NSManaged var english: String?
    @NSManaged var hebrew: String?
    @NSManaged var group: NSNumber?

}
