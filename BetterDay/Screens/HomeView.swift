//
//  HomeView.swift
//  BetterDay
//
//  Created by Linas on 08/11/2024.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    
    TabView {
      Tab("Today", systemImage: "calendar") {
        TodayView()
      }
      
      Tab("Things", systemImage: "heart") {
        ThingsView()
      }
      
      Tab("Reminders", systemImage: "bell") {
        ThingsView()
      }
      
      Tab("Settings", systemImage: "gear") {
        SettingsView()
      }
    }
    .padding()
  }
}

#Preview {
  HomeView()
}
