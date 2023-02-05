//
//  LoginViewController.swift
//  LoginScreenUser
//
//  Created by Apple on 17/01/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let functionObj = FunctionCollection()
    
    @IBOutlet weak var mailUITextField: UITextField!
    @IBOutlet weak var passwordUITextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func welcomeButtonAction(_ sender: Any) {
        if mailUITextField.text == "admin12@gmail.com"{
            var userarray = UserDefaults().array(forKey: mailUITextField.text!)
            let vc = storyboard?.instantiateViewController(withIdentifier: "AdminViewController") as! AdminViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else{
            if let mail = mailUITextField.text , let password =  passwordUITextField.text, (!mail.isEmpty && !password.isEmpty)
            {
                
                if let allDetails = UserDefaults.standard.dictionary(forKey: mail) , allDetails.count > 2 {
                    
                    let passwordInDefault = allDetails["Password"] as! String
                    let userNameInDefault = allDetails["UserName"] as! String
                    let phoneInDefault = allDetails["PhoneNo"] as! String
                    
                    if password == passwordInDefault{
                        moveToWelcome(Password: passwordInDefault, userName: userNameInDefault, PhoneNo: phoneInDefault)
                        
                        
                    } else {
                        functionObj.alert(vc: self, title: "Invalid Password", message: "Please enter valid password")
                    }
                }
                else{
                    functionObj.alert(vc: self, title: "Invalid mail", message: "Please enter valid mail")
                }
                
            }
            else{
                functionObj.alert(vc: self, title: "Invalid Info", message: "Please enter valide info")
            }
        }
        
        
        
    }
    
    func moveToWelcome (Password : String,userName : String,PhoneNo : String){
        let main = UIStoryboard(name: "Main" , bundle: .none)
        
        let detail = main.instantiateViewController(withIdentifier: "welcomeViewController") as! welcomeViewController
        detail.userNameString = userName
        detail.phoneNoString = PhoneNo
        detail.emailString = mailUITextField.text ?? ""
        self.navigationController?.pushViewController(detail, animated: true)
        
        
    }
    
}






