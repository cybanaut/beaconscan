//
//  Setting+CoreDataProperties.swift
//  beaconscan
//
//  Created by waynehui on 8/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Setting {

    @NSManaged var ageGroup: NSNumber?
    @NSManaged var gender: NSNumber?
    @NSManaged var mode: NSNumber?

}
