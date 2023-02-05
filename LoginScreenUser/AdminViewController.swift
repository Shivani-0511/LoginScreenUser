//
//  AdminViewController.swift
//  LoginScreenUser
//
//  Created by Apple on 02/02/23.
//

import UIKit


class AdminViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {
    @IBOutlet weak var adminUITableView: UITableView!
    var emailsArray = [String]()
    
    var datafile = FunctionCollection()
    
   // UserDefaults().dictionaryRepresentation().keys
    
    
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for key in UserDefaults().dictionaryRepresentation().keys{
            
            if datafile.isValidEmail(email: key) && key != "admin12@gmail.com"{
                
                
                emailsArray.append(key)
            }
   
        }
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = adminUITableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = emailsArray[indexPath.row]
        return cell
    }
    
    
}
