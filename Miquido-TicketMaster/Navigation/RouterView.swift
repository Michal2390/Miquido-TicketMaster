//
//  RouterView.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 09/11/2024.
//

import SwiftUI

struct RouterView<Content: View>: View {
    @StateObject var router: Router = Router()
    private let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Router.Route.self) { route in
                    router.view(for: route)
                }
        }
        .environmentObject(router)
    }
}
