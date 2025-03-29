//
//  LoginModel.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/28/25.
//

import Foundation


struct LoginModel: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable, Identifiable {
    let id: String?
    let fullname: String?
    let isactivated: String?
    let username: String?
    let email: String?
    let userpicture: String?
    let token: String?
    let role: String?
    let otp: String?
    let statuscode: String?
    let message: String?
    let success: Bool?
}
