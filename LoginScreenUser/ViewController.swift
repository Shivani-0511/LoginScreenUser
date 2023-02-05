//
//  ViewController.swift
//  LoginScreenUser
//
//  Created by Apple on 17/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.temporaryDirectory)//path show
        print(UserDefaults().dictionaryRepresentation().keys)//check database use this command
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

