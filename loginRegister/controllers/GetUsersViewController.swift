//
//  GetUsersViewController.swift
//  loginRegister
//
//  Created by user177278 on 2/2/21.
//

import UIKit
//,
class GetUsersViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate{
    //Instanciando clases
    let request = Request()
    let alertService = AlertService()
    //variables
    var listas : [String] = []
//    ["hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata","hola", "patata"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     request.getAllUsers(endpoint: "api/users") { [weak self] ( result ) in
     
                 switch result{
                 //Caso success closure
                 case.success(let lista):
                     print("imprimiendo desde getusers")
                     
                    //añadiendo la lista dada por el servidor y añadiendola en array de String para mostrarla en la lista
                    for i in lista {
                        self!.listas.append(i)
                        
                    }
                    //print(type(of: self!.listas))
                 
                    print(self!.listas)
                 
                    
                //Caso failure closure
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
    
    //Presentando lista de usuarios
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "userListItem", for: indexPath)
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "userListItem")
        cell.textLabel?.text = listas[indexPath.row]
    
         return cell
    }

}

    
