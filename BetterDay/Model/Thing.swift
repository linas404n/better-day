//
//  Thing.swift
//  BetterDay
//
//  Created by Linas on 08/11/2024.
//

import Foundation
import SwiftData

@Model
class Thing {
  var title: String = ""
  var lastUpdated: Date = Date()
  var isHidden: Bool = false
  var day: Day?
  
  init(title: String) {
    self.title = title
  }
}
