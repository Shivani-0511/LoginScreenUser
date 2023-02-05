//
//  File.swift
//  LoginScreenUser
//
//  Created by Apple on 19/01/23.
//

import Foundation
import UIKit
class FunctionCollection {
    
    func alert (vc : UIViewController, title: String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
        
    }
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z]+@[A-Za-z]+\\.[com]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    func isValidPassword(testStr:String?) -> Bool {
         
         guard testStr != nil else { return false }
         let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
         return passwordTest.evaluate(with: testStr)
    
     }

}
