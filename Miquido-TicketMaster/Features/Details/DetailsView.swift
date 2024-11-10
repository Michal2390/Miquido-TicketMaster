//
//  DetailsView.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 10/11/2024.
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject var router: Router
    let event: Event
    
    var body: some View {
        VStack {
            eventDetailsView(event: event)
        }
        .navigationTitle("Event Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func eventDetailsView(event: Event) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Constants.vstackSpacing) {
                if let imageURL = event.images.first?.url {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image.resizable()
                             .scaledToFit()
                             .frame(height: Constants.imageFrame)
                    } placeholder: {
                        ProgressView()
                    }
                    .cornerRadius(Constants.cornerRadius)
                }
                
                // Event Name
                Text(event.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                // Event Date
                Text(event.formattedDate)
                        .font(.title2)
                        .foregroundColor(.secondary)
                
                // Event Description
                if let description = event.embedded.venues.first?.name.description {
                        Text(description)
                            .font(.body)
                            .foregroundColor(.primary)
                            .padding(.top, Constants.textPadding)
                    }

                
                if let seatsURL = event.seatmap?.staticURL {
                    AsyncImage(url: URL(string: seatsURL)) { seat in
                        seat
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                 // External Link for Ticket Purchase
                if let url = URL(string: event.url) {
                    Link("Buy Tickets", destination: url)
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.top, Constants.urlPadding)
                }
            }
            .padding()
        }
    }
}

extension DetailsView {
    struct Constants {
        static let vstackSpacing: CGFloat = 20
        static let textPadding: CGFloat = 8
        static let urlPadding: CGFloat = 16
        static let cornerRadius: CGFloat = 12
        static let imageFrame: CGFloat = 300
    }
}
