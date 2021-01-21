//
//  LoginRequest.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import Foundation

struct LoginRequest: Codable {
    let email: String
    let password: String
    let project_id: String
}
