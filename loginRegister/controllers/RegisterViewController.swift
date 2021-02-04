//
//  RegisterViewController.swift
//  loginRegister
//
//  Created by user177278 on 1/26/21.
//

import UIKit


class RegisterViewController: UIViewController {

    //Outlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    
    
    //Instanciando la clase que posee las peticiones
    let request = Request()
    
    //Action
    @IBAction func registerButton(_ sender: Any) {
        
        //Recogiendo informacion de los campos
        let user : String = emailField.text!
        let pass : String = passField.text!
        
        //Comprobando que no esten vacios
        if(user.isEmpty || pass.isEmpty){
            
            return
    
        }
        
        //Ejecutando metodo post que envia los datos al servidor y registrando un usuario
        request.createUser(user: user, pass: pass)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

  

}
