//
//  GetUsersViewController.swift
//  loginRegister
//
//  Created by user177278 on 2/2/21.
//

import UIKit

class GetUsersViewController: UIViewController {
    
    let request = Request()
    let alertService = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request.getAllUsers(endpoint: "api/users") { [weak self] (result) in
            
            switch result{
                
            case.success(let lista):
                print("imprimiendo desde getusers")
                print(lista)
                
                break
             
                
            case.failure(let error):
                
                guard let alert = self?.alertService.alert(message: error.localizedDescription) else {
                        return
                        }
                self?.present(alert,animated: true)
                
                break
                
            
            case.success(_):
                print("no se")
            }
    


}
    
}
}

class TableViewController : UITableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userListItem", for: indexPath)
        
        return cell
    }
}
