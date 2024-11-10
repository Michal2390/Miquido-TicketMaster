//
//  Request.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 08/11/2024.
//

import Foundation

public enum Endpoint {
    case events
    
    public var url: String {
        switch self {
        case .events: return "discovery/v2/events.json?countryCode=PL&apikey=TAGEemR66fnjzOSKeGibI0Q6SMT6c9G1#"
        }
    }
}
public struct RequestURLComponents {
    var scheme: String
    var host: String
    
    static let `default` = RequestURLComponents(scheme: AppConstants.scheme, host: AppConstants.host)
}

public struct Request {
    let endpoint: Endpoint
    var urlComponents: RequestURLComponents = .default
    var method: HTTPMethod = .get
    
    var url: URL? {
        let requestEndopoint = endpoint.url
        let url = urlComponents.scheme + urlComponents.host + requestEndopoint
        guard let endpoint = URL(string: url) else { fatalError("Can't build URL") }
        
        return URL(string: endpoint.absoluteString)
    }
}
