//
//  SignUpViewController.swift
//  LoginScreenUser
//
//  Created by Apple on 17/01/23.
//

import UIKit

class SignUpViewController: UIViewController {
    let functionObj = FunctionCollection()
    var name : newUser?
    var phoneNo : newUser?
    
    
    
    @IBOutlet weak var nameUITextField: UITextField!
    
    @IBOutlet weak var phoneUITextField: UITextField!
    
    @IBOutlet weak var mailUITextField: UITextField!
    
    @IBOutlet weak var passwordUITextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.temporaryDirectory)
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }    // isValidEmail(email: mailUITextField.text)
    
    func saveData() {
        
        if let name = nameUITextField.text , let phoneNo = phoneUITextField.text ,let  phone =  Int(phoneNo) , let mail =  mailUITextField.text , let password = passwordUITextField.text  {
            
            let allDetails = ["Password":password, "UserName":name, "PhoneNo":phoneNo]
            
            UserDefaults.standard.set(allDetails, forKey: mail)
            
        }
        
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        if let mail = mailUITextField.text , !mail.isEmpty{
            if(functionObj.isValidEmail(email: mail) == true){
                if let password = passwordUITextField.text ,
                   !password.isEmpty{
                    if functionObj.isValidPassword(testStr: passwordUITextField.text) == true{
                        saveData()

                        let alert = UIAlertController(title: "Successful", message: "Account created", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in
                            let main = UIStoryboard(name: "Main" , bundle: .none)
                            let vc = main.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                            self.navigationController?.pushViewController(vc, animated: true)
                        } ))
                        present(alert, animated: true, completion: nil)
                            
                    }else
                    {
                        functionObj.alert(vc: self, title: "Inavlid password", message: "Please enter valid password")
                    }
                }else
                {
                    functionObj.alert(vc: self, title: "Empty", message: "Please enter password")
                }
                
            }
            else{
                functionObj.alert(vc: self, title: "Invalid mail", message: "Please enter valid mail")
            }
        }else{
            functionObj.alert(vc: self, title: "Empty", message: "Please enter Username")
        }
        
    }
    
}

