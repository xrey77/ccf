//
//  LoginViewModel.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/28/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var statusCode: String = ""
    @Published var messageInfo: String = ""
    var username: String = ""
    var password: String = ""

    func login() -> Void {
            let url = URL(string: "http://127.0.0.1:9000/user/login")
            let body = LoginRequestBody(username: username, password: password)
            var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(body)
        
//            request.cachePolicy = .reloadIgnoringCacheData
//            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            URLSession.shared.dataTask(with: request) {(data, response, error)  in
//                if let httpResponse = response as? HTTPURLResponse {
//                    DispatchQueue.main.async {
//                        Vars.statscode = String(httpResponse.statusCode)
//                    }
//                }
                
                guard let data = data, error == nil else {
                    return
                }

                if let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data ) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        
                        if loginResponse.username != nil {
                                Vars.userid = loginResponse.id!
                                Vars.isLoggedin = true
                                Vars.fullname = loginResponse.fullname!
                                Vars.username = loginResponse.username!
                                Vars.userpicture = loginResponse.userpicture!
                                self.statusCode = loginResponse.statuscode!
                                self.messageInfo = loginResponse.message!
                        } else {
                            self.statusCode = loginResponse.statuscode!
                            self.messageInfo = loginResponse.message!
                        }
                        
                    }
                }
            
            }.resume()
        }
}

