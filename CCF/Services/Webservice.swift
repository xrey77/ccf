////
////  Webservice.swift
////  CCF
////
////  Created by Reynald Marquez-Gragasin on 3/24/25.
////
//
//import Foundation
//
//enum AuthenticationError: Error {
//    case invalidCrendentials
//    case custom(errorMessage: String)
//    case serverError(statusCode: Int)
//}
//
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable {
    let username: String
    let password: String
}

//struct LoginResponse: Codable, Identifiable {
//    let id: String?
//    let fullname: String?
//    let isactivated: String?
//    let username: String?
//    let email: String?
//    let userpicture: String?
//    let token: String?
//    let message: String?
//    let role: String?
//    let otp: String?
//    let statuscode: String?
//    let success: Bool?
//}
/**
class Webservice {

    func getUserAccount(token: String, completion: @escaping (Result<[Account], NetworkError>) -> Void)  {
        guard let url = URL(string: "http://127.0.0.1:9000/user/login") else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let userdata = data, error == nil else {
                completion(.failure(.noData))
                return
            }

            guard let account = try? JSONDecoder().decode([Account].self, from: userdata) else {
                completion(.failure(.decodingError))
                return
            }

            completion(.success(account))
        }.resume()

    }

    func login(username: String, password: String, completion: @escaping (Result<Account, NetworkError>) -> Void)  {
        guard let url = URL(string: "http://127.0.0.1:9000/user/login") else {
            completion(.failure(.invalidURL))
            return
        }

        let body = LoginRequestBody(username: username, password: password)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)

        URLSession.shared.dataTask(with: request) {(data, response, error)  in
            guard let xdata = data, error == nil else {
                completion(.failure(.noData))
                completion(.failure(.custom(errorMessage: "No data.")))
                return
            }

            guard let loginResponse = try? JSONDecoder().decode(Account.self, from: xdata) else {
                completion(.failure(.decodingError))
                completion(.failure(.invalidCrendentials))
                return
            }

            guard let message = loginResponse.message else {
                completion(.failure(.invalidCrendentials))
                return
            }
            print("Message : \(message)")

            guard let fullname = loginResponse.fullname else {
                completion(.failure(.invalidCrendentials))
                return
            }

            print("Username : \(fullname)")

            guard let token = loginResponse.token else {
                completion(.failure(.invalidCrendentials))
                return
            }

            guard let email = loginResponse.email else {
                completion(.failure(.invalidCrendentials))
                return
            }
            print("Email Address : \(email)")

            print("TOKEN : \(token)")

            completion(.success([loginResponse]))

        }.resume()
    }
 */

/**
    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void)  {
        guard let url = URL(string: "http://127.0.0.1:9000/user/login") else {
            completion(.failure(.custom(errorMessage: "URL is not correct.")))
            return
        }

        let body = LoginRequestBody(username: username, password: password)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        request.cachePolicy = .reloadIgnoringCacheData
        var xstatus: Int = 0
        URLSession.shared.dataTask(with: request) {(data, response, error)  in
            if let httpResponse = response as? HTTPURLResponse {
                xstatus = httpResponse.statusCode
            }

            guard let xdata = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data.")))
                return
            }

            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: xdata) else {
                completion(.failure(.invalidCrendentials))
                return
            }
            print(loginResponse)
            let statuscode: String = String(xstatus)
            print("STATUS CODE : \(statuscode)")
            completion(.success([loginResponse]))
            guard let idno = loginResponse.id else {
                completion(.failure(.invalidCrendentials))
                return
            }

            guard let fullname = loginResponse.fullname else {
                completion(.failure(.invalidCrendentials))
                return
            }

            guard let isactivated = loginResponse.isactivated else {
                completion(.failure(.invalidCrendentials))
                return
            }

            guard let username = loginResponse.username else {
                completion(.failure(.invalidCrendentials))
                return
            }

            guard let email = loginResponse.email else {
                completion(.failure(.invalidCrendentials))
                return
            }

            guard let userpic = loginResponse.userpicture else {
                completion(.failure(.invalidCrendentials))
                return
            }

            guard let token = loginResponse.token else {
                completion(.failure(.invalidCrendentials))
                return
            }

            guard let message = loginResponse.message else {
                completion(.failure(.invalidCrendentials))
                return
            }

            guard let role = loginResponse.role else {
                completion(.failure(.invalidCrendentials))
                return
            }

            guard let otp = loginResponse.otp else {
                completion(.failure(.invalidCrendentials))
                return
            }

            completion(.success([idno, fullname, isactivated, username, email, userpic, token, message, role, otp, statuscode]))

        }.resume()
    }
}

 
 func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void)  {
     guard let url = URL(string: "http://127.0.0.1:9000/user/login") else {
         completion(.failure(.custom(errorMessage: "URL is not correct.")))
         return
     }

     let body = LoginRequestBody(username: username, password: password)

     var request = URLRequest(url: url)
     request.httpMethod = "POST"
     request.addValue("application/json", forHTTPHeaderField: "Content-Type")
     request.httpBody = try? JSONEncoder().encode(body)

     URLSession.shared.dataTask(with: request) {(data, response, error)  in
         guard let xdata = data, error == nil else {
             completion(.failure(.custom(errorMessage: "No data.")))
             return
         }

         guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: xdata) else {
             completion(.failure(.invalidCrendentials))
             return
         }

         guard let message = loginResponse.message else {
             completion(.failure(.invalidCrendentials))
             return
         }
         print("Message : \(message)")

         guard let fullname = loginResponse.fullname else {
             completion(.failure(.invalidCrendentials))
             return
         }

         print("Username : \(fullname)")

         guard let token = loginResponse.token else {
             completion(.failure(.invalidCrendentials))
             return
         }

         guard let email = loginResponse.email else {
             completion(.failure(.invalidCrendentials))
             return
         }
         print("Email Address : \(email)")

         print("TOKEN : \(token)")

         completion(.success(token))

     }.resume()
 }
 */
