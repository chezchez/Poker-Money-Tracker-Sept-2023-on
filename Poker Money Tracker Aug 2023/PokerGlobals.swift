//
//  PokerGlobals.swift
//  Poker Money Tracker Aug 2023
//
//  Created by Jim Cheseborough on 8/13/23.
//

import Foundation
// Our observable object class
final class PokerGlobals: ObservableObject {
    @Published var selectedGame: game? = nil
    @Published var counter: Int = 0
}

 
