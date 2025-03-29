//
//  Account.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/24/25.
//

import Foundation

struct AccountResponse: Codable {
    var results: [Account]
}

struct Account: Codable {
    var id: String
    var token: String
    var statuscode: String
    var fullname: String
    var isactivated: String    
}

