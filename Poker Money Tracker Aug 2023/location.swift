//
//  location.swift
//  Poker Money Tracker Aug 2023
//
//  Created by Jim Cheseborough on 8/9/23.
//

import Foundation
import SwiftData

@Model
final class location {
    @Attribute(.unique) var id: UUID = UUID()
    var text: String
    var Note: String? = nil
    
    init(text: String)
    {self.text = text}
    
    //@Relationship(.deny, .inverse ,\game.location) var
}
