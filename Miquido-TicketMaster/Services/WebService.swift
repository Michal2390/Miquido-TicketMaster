//
//  WebService.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 08/11/2024.
//

import Foundation

class WebService {
    func getEvents() async throws -> [Event] {
        let request: Request = .init(endpoint: .events)
        guard let urlRequest = buildURLRequest(from: request) else { throw NetworkError.badURL }
        let eventModel: EventResponse = try await fetchData(from: urlRequest)
        return eventModel.embedded?.events ?? []
    }
    
    private func fetchData<T: Decodable>(from urlRequest: URLRequest) async throws -> T {
        async let (data, _) = URLSession.shared.data(for: urlRequest)
        return try await JSONDecoder().decode(T.self, from: data)
    }
    
    private func buildURLRequest(from request: Request) -> URLRequest? {
        guard let requestURL = request.url else { return nil }
        
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = request.method.string
        
        return urlRequest
    }
}
