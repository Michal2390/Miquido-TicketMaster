//
//  Miquido_TicketMasterApp.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 03/11/2024.
//

import SwiftUI

@main
struct Miquido_TicketMasterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        RouterView {
            HomeView()
        }
    }
}
//my API key - TAGEemR66fnjzOSKeGibI0Q6SMT6c9G1

