//
//  MainView.swift
//  Poker Money Tracker Aug 2023
//
//  Created by Jim Cheseborough on 8/9/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Label("XXX",systemImage: "list.Dash")
                }
        }
    }
}

#Preview {
    MainView()
}
