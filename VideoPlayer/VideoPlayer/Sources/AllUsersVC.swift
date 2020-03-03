//
//  AllUsersVC.swift
//  VideoPlayer
//
//  Created by Sergey Pogrebnyak on 03.03.2020.
//  Copyright © 2020 Sergey Pogrebnyak. All rights reserved.
//

import UIKit

class AllUsersVC: UIViewController {

    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemCount: UITextField!

    var arrayOfUsers = [User]()
    var arrayOfItems = [Item]()
    var user: User!
    var setOfItems: NSSet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //arrayOfUsers = CoreManager.shared.getAllUsers()!
        //arrayOfItems = CoreManager.shared.getAllItems()!
        arrayOfItems = user!.items.allObjects as! [Item]
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        let item = Item.init(itemName: itemName.text!, count: Int16(itemCount.text!)!)
        let mutableCopy = user.items.mutableCopy() as! NSMutableSet
        mutableCopy.add(item)
        user.items = mutableCopy
        CoreManager.shared.saveContext()
    }
}

extension AllUsersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        cell.textLabel!.text = arrayOfItems[indexPath.row].itemName
        return cell
    }
}
