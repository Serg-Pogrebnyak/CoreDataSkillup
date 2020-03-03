//
//  AllUsersVC.swift
//  VideoPlayer
//
//  Created by Sergey Pogrebnyak on 03.03.2020.
//  Copyright © 2020 Sergey Pogrebnyak. All rights reserved.
//

import UIKit

class AllUsersVC: UIViewController {

    var arrayOfUsers = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfUsers = CoreManager.shared.getElementsArray()!
    }

}

extension AllUsersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfUsers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        cell.textLabel!.text = arrayOfUsers[indexPath.row].name
        return cell
    }
}
