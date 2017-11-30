//
//  Class+CoreDataProperties.swift
//  SSUSchedulePlanner
//
//  Created by Ivan Lim on 11/28/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//
//

import Foundation
import CoreData


extension Class {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Class> {
        return NSFetchRequest<Class>(entityName: "Class")
    }

    @NSManaged public var class_Description: String?
    @NSManaged public var class_Name: String?
    @NSManaged public var class_Units: Int16
    @NSManaged public var term: Term?

}
