//
//  SignupViewModel.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/28/25.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var statusCode = ""
    @Published var messageInfo = ""
    var firstname: String = ""
    var lastname: String = ""
    var email: String = ""
    var mobile: String = ""
    var username: String = ""
    var password: String = ""
    
    func signup() -> Void {
        let url = URL(string: "http://127.0.0.1:9000/user/register")
        let body = RegistrationModel(firstname: firstname, lastname: lastname, email: email, mobile: mobile, username: username, password: password)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        request.cachePolicy = .reloadIgnoringCacheData
    
        URLSession.shared.dataTask(with: request) {(data, response, error)  in
//            if let httpResponse = response as? HTTPURLResponse {
//                DispatchQueue.main.async {
//                    Vars.statscode = String(httpResponse.statusCode)
//                }
//            }
            
            guard let data = data, error == nil else {
                return
            }

            if let signupResponse = try? JSONDecoder().decode(RegistrationResponse.self, from: data ) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    if (signupResponse.statuscode != nil) {
                        self.statusCode = signupResponse.statuscode!
                        self.messageInfo = signupResponse.message!
                    } else {
                        self.statusCode = signupResponse.statuscode!
                        self.messageInfo = signupResponse.message!
                    }
                }

            }
        
        }.resume()
        
    }
}
