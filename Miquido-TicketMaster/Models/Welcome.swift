//
//  Welcome.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 08/11/2024.
//

import Foundation

// MARK: - EventResponse
struct EventResponse: Codable {
    let embedded: EmbeddedEvents?
    
    // Mapped "_embedded" key to `embedded`
    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}

// MARK: - EmbeddedEvents
struct EmbeddedEvents: Codable {
    let events: [Event]
}

// MARK: - Event
struct Event: Codable, Identifiable, Hashable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    let name, type, id: String
    let test: Bool
    let url: String
    let locale: String
    let images: [EventImage]
    let dates: EventDates
    let seatmap: Seatmap?
    let embedded: Embedded
    
    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, images, dates, seatmap
        case embedded = "_embedded"
    }
    
    var formattedDate: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        if let date = inputFormatter.date(from: dates.start.localDate) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd.MM.yyyy"
            return outputFormatter.string(from: date)
        }
        return ""
    }
}

// MARK: - EventDates
struct EventDates: Codable {
    let start: EventStartDate
    let timezone: String
    let spanMultipleDays: Bool
}

// MARK: - EventStartDate
struct EventStartDate: Codable {
    let localDate: String
    let localTime: String?
}

// MARK: - EventImage
struct EventImage: Codable {
    let url: String
}

// MARK: - Embedded
struct Embedded: Codable {
    let venues: [Venue]
}
// MARK: - Venue
struct Venue: Codable {
    let name, type, id: String
    let test: Bool
    let url: String
    let locale, postalCode, timezone: String


    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, postalCode, timezone
    }
}

// MARK: - Seatmap
struct Seatmap: Codable {
    let staticURL: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case staticURL = "staticUrl"
        case id
    }
}


// MARK: - PriceRange
struct PriceRange: Codable {
    let type, currency: String
    let min, max: Int
}
