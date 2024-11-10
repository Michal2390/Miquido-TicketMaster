//
//  NetworkError.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 08/11/2024.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case invalidImageID(Int)
    case decodingError
}
