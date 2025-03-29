//
//  PastorModel.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/27/25.
//

import Foundation

class PastorsViewModel: ObservableObject {
    @Published var pastors: [Pastors] = []

    func loadPastorsdata() {
        guard let url = URL(string: "http://127.0.0.1:9000/getpastors") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Pastors].self, from: data) {
                    DispatchQueue.main.async {
                        self.pastors = decodedResponse
                    }
                }
            }
        }.resume()
    }
}


