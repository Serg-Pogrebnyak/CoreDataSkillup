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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func addNewUser(_ sender: Any) {
        arrayOfUsers.append(User.init(userName: nameTextField.text!))
    }

    @IBAction func presentNewVC(_ sender: Any) {
        let newVC = self.storyboard!.instantiateViewController(withIdentifier: "AllUserVC") as! AllUsersVC
        self.present(newVC, animated: true, completion: nil)
    }

    @IBAction func saveData(_ sender: Any) {
        CoreManager.shared.saveContext()
    }
}
