//
//  ThingsView.swift
//  BetterDay
//
//  Created by Linas on 08/11/2024.
//

import SwiftUI
import SwiftData

struct ThingsView: View {
  
  @Query(filter: Day.currentDayPredicate(), sort: \.date) private var today: [Day]
  @Query(filter: #Predicate<Thing> { $0.isHidden == false }) var things: [Thing]
  
  @Environment(\.modelContext) private var modelContext
  
  @State private var isPresentedAddThingSheet: Bool = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("Things")
        .font(.largeTitle)
        .fontWeight(.bold)
      
      Text("These are the things that make you feel positive and uplifted.")
      
      List {
        ForEach(things) { thing in
          HStack {
            Text(thing.title)
            Spacer()
            Button {
              let today = getToday()
              today?.things?.append(thing)
            } label: {
              Image(systemName: "checkmark.circle")
            }

          }
        }
      }
      .listStyle(.plain)
      
      Spacer()
      
      Button("Add New Thing") {
        isPresentedAddThingSheet = true
      }
      .buttonStyle(.borderedProminent)
      .frame(maxWidth: .infinity, alignment: .center)
      
      Spacer()
    }
    .sheet(isPresented: $isPresentedAddThingSheet) {
      AddThingView()
        .presentationDetents([.fraction(0.3)])
    }
  }
  
  private func getToday() -> Day? {
    // Try to retrieve today from the DB
    if let firstDay = today.first {
      return firstDay
    } else {
      // If it doesn't exist, create a new Day instance and try to save it
      let newDay = Day()
      modelContext.insert(newDay)
      
      do {
        try modelContext.save()
        return newDay
      } catch {
        // Log the error (or handle it in a way suitable for your app)
        print("Failed to save new day to the database: \(error.localizedDescription)")
        return nil
      }
    }
  }
  
}

#Preview {
  ThingsView()
}
