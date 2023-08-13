//
//  Poker_Money_Tracker_Aug_2023App.swift
//  Poker Money Tracker Aug 2023
//
//  Created by Jim Cheseborough on 8/5/23.
//

import SwiftUI
import SwiftData

@main
struct Poker_Money_Tracker_Aug_2023App: App {
@StateObject var globals = PokerGlobals()
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .environmentObject(globals)
                    .tabItem{
                        Label("Main",systemImage: "list.dash")
                    }
                FilterView()
                    .tabItem{
                        Label("Filter",systemImage: "rectangle.and.pencil.and.ellipsis")
                    }
                SettingsView()
                    .tabItem{
                        Label("Settings",systemImage: "gearshape")
                    }
                locationsView()
                    .tabItem{
                        Label("",systemImage: "location.north.circle.fill")
                    }
            }
            //ContentView()
                
        }
        .modelContainer(for: [game.self ,location.self])
    }
}
