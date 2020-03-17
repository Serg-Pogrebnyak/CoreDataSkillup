//
//  MainVC.swift
//  VideoPlayer
//
//  Created by Sergey Pogrebnyak on 03.03.2020.
//  Copyright © 2020 Sergey Pogrebnyak. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!

    var arrayOfUsers = [User]()
    var arrayOfItems = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfUsers = CoreManager.shared.getAllUsers()!
    }

    @IBAction func didTapOnRootView(_ sender: Any) {
        self.view.endEditing(true)
    }


    @IBAction func addNewUser(_ sender: Any) {
        arrayOfUsers.append(User.init(userName: nameTextField.text!))
        //arrayOfItems.append(Item.init(itemName: nameTextField.text!, count: 5))
    }

    @IBAction func presentNewVC(_ sender: Any) {
        CloudCoreDataManager.shared.saveUsersToCloud(users: arrayOfUsers)
    }

    @IBAction func saveData(_ sender: Any) {
        CoreManager.shared.saveContext()
    }
}

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVC = self.storyboard!.instantiateViewController(withIdentifier: "AllUserVC") as! AllUsersVC
        newVC.user = arrayOfUsers[indexPath.row]
        self.present(newVC, animated: true, completion: nil)
    }
}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfUsers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        cell.textLabel!.text = arrayOfUsers[indexPath.row].name
        return cell
    }
}
