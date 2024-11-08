//
//  Day.swift
//  BetterDay
//
//  Created by Linas on 08/11/2024.
//

import Foundation
import SwiftData

@Model
class Day {
  var date: Date = Date()
  @Relationship(inverse: \Thing.day) var things: [Thing]?
  
  init() {}
}

extension Day {
  static func currentDayPredicate() -> Predicate<Day> {
    let calendar = Calendar.autoupdatingCurrent
    let start = calendar.startOfDay(for: Date.now)
    
    return #Predicate<Day> { $0.date >= start }
  }
}
