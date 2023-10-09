//
//  University+CoreDataProperties.swift
//  PraticeOfCoreData4
//
//  Created by Saahil Kaushal on 09/10/23.
//
//

import Foundation
import CoreData


extension University {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<University> {
        return NSFetchRequest<University>(entityName: "University")
    }

    @NSManaged public var davCollege: String?
    @NSManaged public var hmvCollege: String?
    @NSManaged public var khalsaCollege: String?

}

extension University : Identifiable {

}
