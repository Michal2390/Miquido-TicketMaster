//
//  AsyncCircleImage.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 09/11/2024.
//

import SwiftUI

struct AsyncCircleImage: View {
    let radius: Double
    let imageURL: String?
    
    var body: some View {
        if let imageURL = imageURL, let url = URL(string: imageURL) {
            AsyncImage(url: url) { image in
                image.resizable()
                    .frame(width: radius * 2, height: radius * 2)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
                    .frame(width: radius * 2, height: radius * 2)
            }
        } else {
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: radius * 2, height: radius * 2)
        }
    }
}
