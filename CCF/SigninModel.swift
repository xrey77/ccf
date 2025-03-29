//
//  SigninModel.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/26/25.
//

import Foundation

class SignupModel: ObservableObject {
    
    func signup(fname: String, lname: String, email: String, mobile: String, usrname: String, pword: String) {
        let url = URL(string: "http://127.0.0.1:9000/user/register")
        let body = LoginRequestBody(username: username, password: password)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        request.cachePolicy = .reloadIgnoringCacheData
    
        URLSession.shared.dataTask(with: request) {(data, response, error)  in
            if let httpResponse = response as? HTTPURLResponse {
                Vars.statcode = httpResponse.statusCode
            }
            guard let data = data, error == nil else {
                Vars.statcode = 500
                return
            }
            
            print(Vars.statcode)
            if let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data ) {
                if (loginResponse.fullname != nil) {
                    Vars.userid = loginResponse.id!
                    Vars.fullname = loginResponse.fullname!
                    Vars.username = loginResponse.username!
                    Vars.isLoggedin = true
                }
            }
        
        }.resume()c
        
        
    }
}
