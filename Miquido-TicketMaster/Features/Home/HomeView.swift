//
//  HomeView.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 08/11/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack {
            background
            VStack {
                homeHeader
                allEventsList
                    .transition(.move(edge: .leading))
            }
            .padding()
            .frame(maxWidth: .infinity)
        }.task {
            homeViewModel.fetchEvents()
        }
    }
}

private extension HomeView {
    var background: some View {
        Color.theme.background
            .ignoresSafeArea()
    }
    
    var homeHeader: some View {
        HStack {
            Spacer()
            Text(Constants.subtitleTitle)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .blue.opacity(0.8)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .shadow(color: .blue.opacity(0.3), radius: 2, x: 0, y: 2)
        }
    }
    
    var allEventsList: some View {
        ScrollView {
            LazyVStack {
                ForEach(homeViewModel.events) { event in
                    EventRowView(event: event)
                        .padding(.horizontal, Constants.horizontalPadding)
                        .onTapGesture {
                            router.navigateTo(.detailsView(event))
                        }
                }
            }
        }
    }
}

extension HomeView {
    struct Constants {
        static let subtitleTitle = "TicketMaster Events"
        static let horizontalPadding = CGFloat(10)
    }
}
#Preview {
    HomeView()
}
