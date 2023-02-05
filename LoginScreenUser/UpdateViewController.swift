//
//  UpdateViewController.swift
//  LoginScreenUser
//
//  Created by Apple on 01/02/23.
//

import UIKit

class UpdateViewController: UIViewController {
    let functionnew = FunctionCollection()
    
    @IBOutlet weak var nameUITextField: UITextField!
    
    @IBOutlet weak var phoneUITextField: UITextField!
    
    @IBOutlet weak var mailUITextField: UITextField!
    
    @IBOutlet weak var passwordUITextField: UITextField!
    var userNameString : String?
    var phoneNoString : String?
    var emailString : String?
    var passwordString : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.temporaryDirectory)
        
        nameUITextField.text = userNameString
        phoneUITextField.text = phoneNoString
        mailUITextField.text = emailString
        passwordUITextField.text = passwordString
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func saveData() {
        
        if let name = nameUITextField.text , let phoneNo = phoneUITextField.text ,let  phone =  Int(phoneNo) , let mail =  mailUITextField.text , let password = passwordUITextField.text  {
            
            let allDetails = ["Password":password, "UserName":name, "PhoneNo":phoneNo , "email":mail]
            
            UserDefaults.standard.set(allDetails, forKey: mail)
            
        }
        
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
       let username = nameUITextField.text ?? ""
        
        let email = mailUITextField.text ?? ""
        
        let mobilenumber = phoneUITextField.text ?? ""
        
        let password = passwordUITextField.text ?? ""
        
        
            if(functionnew.isValidPassword(testStr: password)){
                
                let list = ["Username":username,"Password":password,"MobileNo":mobilenumber]
                UserDefaults.standard.set(list, forKey: email)
             
                if let mail = mailUITextField.text , !mail.isEmpty{
                    if(functionnew.isValidEmail(email: mail) == true){
                        if let password = passwordUITextField.text ,
                           !password.isEmpty{
                            if functionnew.isValidPassword(testStr: passwordUITextField.text) == true{
                                UserDefaults().removeObject(forKey: mail)
                                saveData()
                                
                            }else
                            {
                                functionnew.alert(vc: self, title: "Error", message: "Invalid Password")
                                
                            }
                        }
                    }
                    else{
                        functionnew.alert(vc: self, title: "Error", message: "Invalid E-mail")
                    }
                    
                }
 
            }
        }
        
    }








