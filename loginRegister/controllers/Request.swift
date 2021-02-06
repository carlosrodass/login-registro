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
                    //Enseñar error
                    completion(.failure(unwrappedError))
                }
                if let unwrappedData = data{
                    
                    print(unwrappedData)
                    do {
                        //Caso respuesta correcto
                        completion(.success(unWrappedResponse.statusCode))
                            
                    }catch {
                        //Caso respuesta error
                        completion(.failure(error))
                    }

                }
            }
        }
        task.resume()
        
        
        
    }
    
    //Respuestas a peticion LogIn
    enum logInError: Error{
        case badURL
        case badResponse
    }
    
    
    //Obtener lista de usuarios
    func getAllUsers(endpoint: String , completion: @escaping (Result<[String], Error>) -> Void){
       
    
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

            if let unwrappedData = data{
                print(unwrappedData)
            
                do{
                    let json = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
                    print(json)

                    if let usuarios = try? JSONDecoder().decode([String].self, from: unwrappedData){

                        completion(.success(usuarios))

                   

                    }else{
                        let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: unwrappedData)
                            completion(.failure(errorResponse))
                           
                        }
                                
                }catch{
                    completion(.failure(error))
                    print("estoy aqui")
                    print(error)
                }
            }
        }
        session.resume()
        
  
}
}
                      
