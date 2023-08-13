//
//  game.swift
//  Poker Money Tracker Aug 2023
//
//  Created by Jim Cheseborough on 8/6/23.
//

import Foundation
import SwiftData

@Model
final class game {
  @Attribute(.unique) var id: UUID
  var BuyIn: Decimal
  var CashOut: Decimal
  var DateStart : Date
  var DateEnd : Date
  var Tips: Decimal
  var Note: String
  var Flag: Bool
  var Noteable : Bool
  var Running : Bool
  var BreakStartTime : Date?
  var BreakMinsTotal : Double
  var BreakMinThisBreak : Double
    //var location: location? = nil
    
    //@Relationship(inverse:  \.location.id) var location: [location]
    @Relationship(.deny)
        var location: [location]// = []
    init() {
      self.id = UUID()
      self.BuyIn = Decimal(Int.random(in: 100...200))
      self.CashOut = Decimal(Int.random(in: 160...439))
      self.DateStart = Date.now
      self.DateEnd = Date.now
      self.Tips = 0
      self.Note = "da note"
        self.Flag = false
        self.Noteable  = false
        self.Running = true
        self.BreakStartTime = nil
        self.BreakMinsTotal = 0
        self.BreakMinThisBreak = 0
    }
}

//@Model
//final class Item {
//    var timestamp: Date
//    
//    init() {
//        self.timestamp = timestamp
//    }
//}

//@Model
//class game: Identifiable {
//    @Attribute(.unique) var id: UUID
//    var BuyIn: Decimal
//    var CashOut: Decimal
//    var DateStart : Date
//    var DateEnd : Date
//    var Tips: Decimal
//    var Note: String
//    var Flag: Bool
//    var Noteable : Bool
//    var Running : Bool
//    var BreakStartTime : Date
//    var BreakMinsTotal : Double
//    var BreakMinThisBreak : Double
//    
//    init() {
//        self.id = UUID()
//
//
//    }
//}
