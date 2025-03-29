//
//  RegistrationModel.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/28/25.
//

import Foundation


struct RegistrationModel: Codable {
    let firstname: String
    let lastname: String
    let email: String
    let mobile: String
    let username: String
    let password: String
}

struct RegistrationResponse: Codable {
    let firstname: String?
    let lastname: String?
    let email: String?
    let mobile: String?
    let username: String?
    let password: String?
    let statuscode: String?
    let message: String?
}
