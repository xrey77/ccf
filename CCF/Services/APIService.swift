//
//  APIService.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/27/25.
//

import Foundation

class APIService {
    
    func fetchPastors(completion: @escaping ([Pastors]?) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:9000/getpastors") else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors
            if let error = error {
                print("Error fetching posts: \(error.localizedDescription)")
                completion(nil)
                return
            }

            // Check for valid response and data
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                print("Invalid response or data")
                completion(nil)
                return
            }

            // Decode the JSON data
            do {
                let posts = try JSONDecoder().decode([Pastors].self, from: data)
                completion(posts)
            } catch {
//                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }

        task.resume()
    }
}
