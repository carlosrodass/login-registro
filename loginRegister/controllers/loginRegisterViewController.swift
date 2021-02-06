//
//  loginRegisterViewController.swift
//  loginRegister
//
//  Created by user177278 on 1/20/21.
//

import UIKit

class loginRegisterViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Login button style
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        
        //register button style
        registerButton.layer.cornerRadius = 10
        registerButton.clipsToBounds = true
       
    }
    

  

}
