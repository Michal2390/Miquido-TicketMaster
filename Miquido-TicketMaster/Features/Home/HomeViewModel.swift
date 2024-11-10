//
//  HomeViewModel.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 09/11/2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var showDetails: Bool = false
    
    private let webService = WebService()
    
    @MainActor func fetchEvents() {
        Task {
            do {
                self.events = try await self.webService.getEvents()
                print("Events: \(self.events)")
            } catch {
                print("Error code: \(error.localizedDescription)")
            }
        }
    }
}
