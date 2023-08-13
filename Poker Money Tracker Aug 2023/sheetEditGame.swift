//
//  sheetEditGame.swift
//  Poker Money Tracker Aug 2023
//
//  Created by Jim Cheseborough on 8/10/23.
//

import SwiftUI
struct sheetEditGame: View {
    @EnvironmentObject var globals: PokerGlobals
    @State private var showingAlert = false
    @State private var note = ""
    
    var body: some View {
//        Text("Old Buyin: \(globals.selectedGame!.BuyIn.description)")
//            Button("Add $1 to buy in", action: Add1ToBuyIn)
    Button("Enter name") {
                showingAlert.toggle()
    }
    .alert("Enter your name", isPresented: $showingAlert) {
        TextField("Old note: \(globals.selectedGame!.Note)", text: $note)
                Button("OK", action: submit)
    } message: {
        Text("Xcode will print whatever you type.")
    }
}
        
    func Add1ToBuyIn() {
        globals.selectedGame!.BuyIn += 1
        }
    func submit() {
        globals.selectedGame!.Note = note
        print("You entered \(globals.selectedGame!.Note)")
        }
    }


#Preview {
    sheetEditGame()
}
