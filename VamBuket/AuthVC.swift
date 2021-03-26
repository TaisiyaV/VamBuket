//
//  ViewController.swift
//  VamBuket
//
//  Created by tasya on 24.03.2021.
//  Copyright © 2021 Taisiya V. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let auth = NetworkService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        auth.authorization()
        auth.getUserData()
    }
    
}

