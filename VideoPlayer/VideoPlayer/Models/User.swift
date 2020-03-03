//
//  User.swift
//  VideoPlayer
//
//  Created by Sergey Pogrebnyak on 03.03.2020.
//  Copyright © 2020 Sergey Pogrebnyak. All rights reserved.
//

import Foundation

class User {
    let name: String
    private let id: String

    init(userName: String) {
        self.name = userName
        self.id = UUID().uuidString
    }
}
