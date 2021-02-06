//
//  ForgotViewController.swift
//  loginRegister
//
//  Created by user177278 on 1/26/21.
//

import UIKit

class ForgotViewController: UIViewController {

    //Outlets
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var emailField: UITextField!
    
    //Actions
    @IBAction func resetPassButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
      
    }
    
    

}
