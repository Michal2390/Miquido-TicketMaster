//
//  Color.swift
//  Miquido-TicketMaster
//
//  Created by Michal Fereniec on 08/11/2024.
//

import SwiftUI
import Foundation

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = AngularGradient(gradient: Gradient(colors: [.green.opacity(0.1), Color.blue]), center: .topTrailing)
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
