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
    
    //Instanciando la clase que posee las peticiones
    let request = Request()
    
    //Actions
    @IBAction func goButton(_ sender: Any) {
        
        let name : String = emailField.text!
        let pass : String = passField.text!
        
        let parameters = ["name": name, "pass":pass]
        
        request.logIn(endpoint: "/api/login", parameters: parameters) { (result) in
            print(result)
        }
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   

}
