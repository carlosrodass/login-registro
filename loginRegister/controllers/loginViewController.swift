//
//  loginViewController.swift
//  loginRegister
//
//  Created by user177278 on 1/26/21.
//

import UIKit

class loginViewController: UIViewController {

    //Outlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    
    //Actions
    @IBAction func goButton(_ sender: Any) {
        
        //Recogiendo informacion de los campos
        if((emailField.text != nil) && (passField != nil)){
            
            let email : String = emailField.text!
            let pass : String = passField.text!
            
            User.init(email: email, password: pass)
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   

}
