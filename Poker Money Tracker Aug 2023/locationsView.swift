//
//  locationsView.swift
//  Poker Money Tracker Aug 2023
//
//  Created by Jim Cheseborough on 8/10/23.
//

import SwiftUI
import SwiftData

struct locationsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [location]

    var body: some View {
        NavigationSplitView {
                List {
                    if !items.isEmpty{
                        ForEach(items) { item in
                            NavigationLink {
                                //Text("Item at \(item.DateStart, format: Date.FormatStyle(date: .numeric, time: .standard))")
                            } label: {
                                Text(item.text)
                                    .fixedSize(horizontal: true, vertical: false)//https://www.reddit.com/r/SwiftUI/comments/wrytc1/why_is_my_text_wrapping_like_this_how_can_i_make/
                                Image("bb")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 15)
                            }
                            .listRowBackground(Color.cyan) // Uses Color
                        }
                    .onDelete(perform: deleteItems)
                    }
                }
            
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
        //}
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = location(text: "Yo Loc2")
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: game.self)//, inMemory: true)
//}

