//
//  CloudCoreDataManager.swift
//  VideoPlayer
//
//  Created by Sergey Pogrebnyak on 04.03.2020.
//  Copyright © 2020 Sergey Pogrebnyak. All rights reserved.
//

import Foundation
import CloudKit

class CloudCoreDataManager {
    static let shared = CloudCoreDataManager()


    private let privateCloudDatabase = CKContainer.init(identifier: "iCloud.com.testnixsolutions.CoreDataTest").publicCloudDatabase

    func saveUsersToCloud(users: [User]) {
        guard !users.isEmpty else {return}

        for user in users {
            let record = CKRecord(recordType: "User")
            record.setValue(user.name, forKey: "name")
            record.setValue(user.items.allObjects as! [Item], forKey: "items")
            record.setValue(user.idLocal, forKey: "idLocal")
            privateCloudDatabase.save(record) { (optionalRecord, error) in
                if error == nil {
                    print("✅user with name - \(user.name) successful saved")
                } else {
                    print("❌user with name - \(user.name) didn't saved")
                }
            }
        }
    }
}
