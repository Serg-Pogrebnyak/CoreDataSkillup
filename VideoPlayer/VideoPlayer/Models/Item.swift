//
//  Item.swift
//  VideoPlayer
//
//  Created by Sergey Pogrebnyak on 03.03.2020.
//  Copyright © 2020 Sergey Pogrebnyak. All rights reserved.
//

import Foundation
import CoreData

class Item: NSManagedObject {
    @NSManaged public var itemName: String
    @NSManaged public var count: Int16
    @NSManaged private var idLocal: String
    @NSManaged private var rootUser: User

    init(itemName: String, count: Int16) {
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: CoreManager.shared.coreManagerContext)!
        super.init(entity: entity, insertInto: CoreManager.shared.coreManagerContext)
        self.itemName = itemName
        self.count = count
        self.idLocal = UUID().uuidString
    }

    private override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    @nonobjc public func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }
}
