//
//  Router.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 09/11/2024.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    enum Route: Hashable {
        case homeView
        case detailsView(Event)
    }
    
    @Published var path: NavigationPath = NavigationPath()
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .homeView:
            HomeView()
        case .detailsView(let event):
            DetailsView(event: event)
        }
    }
    
    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    func navigateBack(_ appRoute: Route) {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
