//
//  NetworkResponse.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 08/11/2024.
//

import Foundation

struct NetworkResponse {
    var data: Data?
    var httpHeader: [AnyHashable: Any]?
    var statusCode: Int
    
    var isSuccess: Bool {
        return statusCode >= 200 && statusCode <= 299
    }
}
