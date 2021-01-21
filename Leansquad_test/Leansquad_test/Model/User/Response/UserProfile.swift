//
//  UserProfile.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import Foundation

struct UserProfile {
    
    var id: String?
    var first_name: String?
    var last_name: String?
    var email: String?
    var last_seen_at: String?
    var project_id: String?
    var prototype_owner: Bool?
    
    enum Keys: String {
        case id
        case first_name
        case last_name
        case email
        case last_seen_at
        case project_id
        case prototype_owner
    }
    
    init(from dict: [String : Any]) {
        self.id = dict[Keys.id.rawValue] as? String
        self.first_name = dict[Keys.first_name.rawValue] as? String
        self.last_name = dict[Keys.last_name.rawValue] as? String
        self.email = dict[Keys.email.rawValue] as? String
        self.last_seen_at = dict[Keys.last_seen_at.rawValue] as? String
        self.project_id = dict[Keys.project_id.rawValue] as? String
        self.prototype_owner = dict[Keys.prototype_owner.rawValue] as? Bool
    }
    
}
