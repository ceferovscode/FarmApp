//
//  Mylist+CoreDataProperties.swift
//  FarmApp
//
//  Created by Alparslan Cafer on 08.03.24.
//
//

import Foundation
import CoreData


extension Mylist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mylist> {
        return NSFetchRequest<Mylist>(entityName: "Mylist")
    }

    @NSManaged public var shortdescription: String?
    @NSManaged public var image: Data?
    @NSManaged public var productName: String?
    @NSManaged public var amount: String?
    @NSManaged public var date: Date?

}

extension Mylist : Identifiable {

}
