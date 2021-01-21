//
//  LoginResponse.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import Foundation

struct LoginResponse {
    
    let access_token: String?
    let user: UserProfile?
    
    enum Keys: String {
        case access_token
        case user
    }
    
    init(from dict: [String: Any]) {
        self.access_token = dict[Keys.access_token.rawValue] as? String
        
        
        if let userData = dict[Keys.user.rawValue] as? [String: Any] {
//            do {
//                let json = try JSONSerialization.jsonObject(with: userData, options: [])
//                if let dictionary = json as? [String : Any] {
                    self.user = UserProfile(from: userData)
//                }else{
//                    self.user = nil
//                }
//            } catch {
//                debugPrint(error.localizedDescription)
//                self.user = nil
//            }
        }else{
            debugPrint("User data is nil")
            self.user = nil
        }
    }
    
}
