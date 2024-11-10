//
//  EventRowView.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 09/11/2024.
//

import SwiftUI

struct EventRowView: View {
    var event: Event
    var showNavIcon: Bool = false
    
    var body: some View {
        HStack(spacing: 15) {
            if let firstImageURL = event.images.first?.url { //tu zajebiście zrobiłem 😎
                AsyncCircleImage(radius: 40, imageURL: firstImageURL)
            } else {
                AsyncCircleImage(radius: 40, imageURL: nil)
            }
            VStack(alignment: .leading, spacing: 8) {
                            // Event Name
                            Text(event.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                             //Event Date (formatted as needed)
                Text(event.formattedDate)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            
                            // Event Venue
                if let venue = event.embedded.venues.first?.name {
                                Text(venue)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                            }
                        }
                        Spacer()
        }
        .padding(.vertical)
        .frame(alignment: .leading)
    }
}


//#Preview {
//    EventRowView()
//}
