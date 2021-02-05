import Foundation


class Request{
    
    //registro usuario
    func createUser(user : String, pass : String){
        
        let parameters = ["user":user ,"pass":pass]
        
        guard let url = URL(string: "https://superapi.netlify.app/api/register") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else{
            return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            if let response = response{
                print(response)
            }
            
            if let data = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch{
                    print(error)
                }
            }
        }.resume()
        
    }
    
    //Login de usuario
    func logIn(endpoint: String
               , parameters: [String: Any]
               ,completion: @escaping (Result<Int, Error>) -> Void){
         
        let baseURl = "https://superapi.netlify.app/"
        guard let url = URL(string: baseURl + endpoint) else {
            completion(.failure(logInError.badURL))
            return
        }
        
        var request = URLRequest(url: url)
        
 
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else{
        return
            
        }
        
        request.httpBody = httpBody
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request){(data, response, error) in
            
            DispatchQueue.main.async {
                guard let unWrappedResponse = response as? HTTPURLResponse else{
                    completion(.failure(logInError.badResponse))
                    return
                }
                
                print(unWrappedResponse.statusCode)
                
                switch unWrappedResponse.statusCode{
                case 200 ..< 300:
                    print("success")
                
                default:
                    print("failure")
                }
                
                if let unwrappedError = error{
                    completion(.failure(unwrappedError))
                }
                if let unwrappedData = data{
                    
                    print(unwrappedData)
                    do {
                    
                        completion(.success(unWrappedResponse.statusCode))
                            
                    }catch {
                        completion(.failure(error))
                    }

                }
            }
        }
        task.resume()
        
        
        
    }
    
    
    enum logInError: Error{
        case badURL
        case badResponse
    }
    
    
    
    //Obtener lista de usuarios
    func getAllUsers(endpoint: String
                        ,completion: @escaping (Result<[String], Error>) -> Void){
       
        
        //let baseUrl = URL(string: "https://superapi.netlify.app/")
        
        guard let url = URL(string: "https://superapi.netlify.app/" + endpoint) else {
            completion(.failure(logInError.badURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
           DispatchQueue.main.async {
                guard let unWrappedResponse = response as? HTTPURLResponse else{
                    completion(.failure(logInError.badResponse))
                    return
            }

                print(unWrappedResponse.statusCode)
                print("succes get Users")

            }
//            if let response = response{
//                print(response)
//            }
            
            if let unwrappedData = data{
                print(unwrappedData)
            
                do{
                    let json = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
                    //print(json)

                    if let users = try? JSONDecoder().decode([String].self, from: unwrappedData){

                        completion(.success(users))



                    }else{
                            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: unwrappedData)
                            completion(.failure(errorResponse))
                        }
                                
                }catch{
                   completion(.failure(error))
                    print("estoy aqui")
                }
            }
        }
        session.resume()
        
        
}
}
//let json = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
//print(json)


// users = try JSONDecoder().decode([User].self, from: unwrappedData)
                   //for user in users! {
                       //print(user.name, user.pass)
                       //}

//        var components = URLComponents()
 //
 //        var queryItems = [URLQueryItem]()
 //
 //        for (key, value) in parameters {
 //            let queryItem = URLQueryItem(name: key, value: String(describing: value))
 //            queryItems.append(queryItem)
 //        }
 //
 //        components.queryItems = queryItems
 //        //name=wa&pass=wa
 //        let queryItemData = components.query?.data(using: .utf8)




//                        do{
////                            let json = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
////                                print(json)
//
//                            if let users = try? JSONDecoder().decode(Respuesta.self, from: unwrappedData){
//
//                                print(users.respuesta)
//
//                                completion(.success(users))
//                            }else{
//
//                              let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: unwrappedData)
//                                    completion(.failure(errorResponse))
//                                }
//                        }catch{
//                            completion(.failure(error))
//
//                        }
