//
//  BetterDayApp.swift
//  BetterDay
//
//  Created by Linas on 08/11/2024.
//

import SwiftUI
import SwiftData

@main
struct BetterDayApp: App {
  var body: some Scene {
    WindowGroup {
      HomeView()
        .modelContainer(for: [Day.self, Thing.self])
    }
  }
}
