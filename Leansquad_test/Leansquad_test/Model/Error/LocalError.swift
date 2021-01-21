//
//  LocalError.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import Foundation

enum LocalError: Error {
    
    case unknown
    case connection_lost
    
    case wrong_email_format

    var localizedDescription: String {
        switch self {
        
        //MARK: - unknown
        case .unknown:
            debugPrint(comment)
            return NSLocalizedString("Unknown error", comment: comment)

        //MARK: - connection_lost
        case .connection_lost:
            debugPrint(comment)
            return NSLocalizedString("Server connection error", comment: comment)
        
        //MARK: - wrong_email_format
        case .wrong_email_format:
            debugPrint(comment)
            return NSLocalizedString("Inputed email has wrong format", comment: comment)
        
        }
    }
    
    //MARK: -
    private var comment: String {
        switch self {
        default: return "CUSTOM ERROR: LocalErrors: \(self)"
        }
    }
    
}
