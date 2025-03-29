//
//  UserModel.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/28/25.
//

import Foundation

struct UserModel: Codable {
    let id: String
    let token: String
    let statuscode: String
    let fullname: String
    let isactivated: String
}
