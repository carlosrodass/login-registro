import Foundation


class Request{
    
    func PostUsers(email :String, pass: String ){
        
        let url = URL(string: "https://superapi.netlify.app/api/register")
        var peticionPost = URLRequest(url: url!)
        peticionPost.httpMethod = "POST"
        peticionPost.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let parametros = "email\(email)&&pass\(pass)"
        peticionPost.httpBody = parametros.data(using: .utf8)
        
        URLSession.shared.dataTask(with: peticionPost){
            data, response, error in
            
            if(error == nil){
                print(String(data: data!, encoding: .utf8))
            }else{
                print(error!)
            }
        }.resume()
        
    }
    
}

