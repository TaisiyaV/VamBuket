//
//  ViewController.swift
//  VamBuket
//
//  Created by tasya on 24.03.2021.
//  Copyright © 2021 Taisiya V. All rights reserved.
//

import UIKit


class AuthVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let auth = NetworkService()
   
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let login = loginTextField.text, let password = passwordTextField.text else { return }
        
        auth.authorization(login: login, password: password, onCompleted: {
            self.presentUserVC()
        }) { (error) in
            self.showAlert(error: error)
        }

    }
   
    func showAlert(error: Error) {
        let alert = UIAlertController(title: nil, message: "Неверный логин или пароль.", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentUserVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let userViewController = storyboard.instantiateViewController(withIdentifier: "userVC") as UIViewController
        userViewController.modalPresentationStyle = .fullScreen
        self.present(userViewController, animated: false, completion: nil)
    }
   
}

