//
//  AddThingView.swift
//  BetterDay
//
//  Created by Linas on 08/11/2024.
//

import SwiftUI
import SwiftData

struct AddThingView: View {
  
  @Environment(\.modelContext) private var modelContext
  @Environment(\.dismiss) private var dismiss
  
  @State private var thingTitle: String = ""
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      TextField("What makes you feel good?", text: $thingTitle)
        .textFieldStyle(.roundedBorder)
      
      HStack {
        Button("Add Thing") {
          addThing()
          thingTitle = ""
          dismiss()
        }
        .buttonStyle(.borderedProminent)
        .disabled(thingTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        
        Button("Dismiss") {
          thingTitle = ""
          dismiss()
        }
        .buttonStyle(.borderedProminent)
      }
    }
    .padding(.horizontal)
  }
  
  private func addThing() {
    let newThing = Thing(title: thingTitle)
    modelContext.insert(newThing)
    try! modelContext.save()
  }
}

#Preview {
  AddThingView()
}
