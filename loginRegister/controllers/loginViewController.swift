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
    let alertService = AlertService()
    
    //Actions
    @IBAction func goButton(_ sender : Any) {
        
        let name : String = emailField.text!
        let pass : String = passField.text!
        
        let parameters = ["user":name, "pass":pass]
        
        request.logIn(endpoint: "api/login", parameters: parameters) { [weak self] (result) in
            
            switch result{
            
            case.success(200):
                //self?.performSegue(withIdentifier: "profileSegue", sender: self)
            print("Estoy entrando aqui")
                
                
            case.failure(let error):
                guard let alert = self?.alertService.alert(message: error.localizedDescription) else {
                    return
                }
                self?.present(alert,animated: true)
            case .success(_):
                print("no se que pasa")
            }
                
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let profileVC = segue.destination as? ProfileViewController, let user = sender as? User {
//
//
//        }
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   

}
