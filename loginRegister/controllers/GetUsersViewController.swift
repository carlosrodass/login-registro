//
//  GetUsersViewController.swift
//  loginRegister
//
//  Created by user177278 on 2/2/21.
//

import UIKit

class GetUsersViewController: UIViewController {
    
    
   
    let request = Request()
    
    
    //Instanciando la clase que posee las peticiones
    @IBAction func getList(_ sender: Any) {
        print("presionado")
        request.getAllUsers()
    }
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //let usuarios = request.getUseers()
        
       
           
    }
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
