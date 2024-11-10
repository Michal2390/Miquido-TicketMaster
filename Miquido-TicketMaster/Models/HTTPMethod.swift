//
//  HTTPMethod.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 08/11/2024.
//

import Foundation

enum HTTPMethod {
    case get
    case post
    
    var string: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        }
    }
}
