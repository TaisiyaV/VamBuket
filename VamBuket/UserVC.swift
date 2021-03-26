//
//  AboutUserVC.swift
//  VamBuket
//
//  Created by tasya on 24.03.2021.
//  Copyright © 2021 Taisiya V. All rights reserved.
//

import UIKit

class UserVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    let auth = NetworkService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "jwt")
        print(userDefaults.object(forKey: "jwt") ?? "entry has been deleted")
            
    }
    


}
