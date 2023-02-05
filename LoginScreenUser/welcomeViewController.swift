//
//  welcomeViewController.swift
//  LoginScreenUser
//
//  Created by Apple on 17/01/23.
//

import UIKit

class welcomeViewController: UIViewController {
    
    
    @IBOutlet weak var userNameUILabel: UILabel!
    
    @IBOutlet weak var mailUILabel: UILabel!
    @IBOutlet weak var phoneNoUILabel: UILabel!
   // var userNameString : String?
    //var mobilenoString : String?
    var emailString : String?
    var userNameString : String?
    var phoneNoString : String?
    var passwordString : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = userNameUILabel.text {
            userNameUILabel.text = "User Name : \(userNameString!)"
        }
        if let phoneNumber = phoneNoUILabel.text{
            phoneNoUILabel.text = "Mobile No : \(phoneNoString!)"
            
        }
        if let email = mailUILabel.text{
            mailUILabel.text = "E-mail : \(emailString!)"
        }
        
    }
    
    
    @IBAction func editDetailButtonAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle:.none)
        let editDetail = storyBoard.instantiateViewController(withIdentifier: "UpdateViewController") as! UpdateViewController
        editDetail.userNameString = userNameString
        editDetail.emailString = emailString
        editDetail.phoneNoString = phoneNoString
        editDetail.passwordString = passwordString
        
       self.navigationController?.pushViewController(editDetail, animated: true)
       
        
        
        
    }
    
}
