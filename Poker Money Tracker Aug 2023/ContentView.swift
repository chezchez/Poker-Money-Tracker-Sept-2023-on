//
//  ContentView.swift
//  ItPersists
//
//  Created by Jim Cheseborough on 8/7/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) public var modelContext
    @Query public var items: [game]
    @State public var showModal: Bool = false
    
    @EnvironmentObject var globals: PokerGlobals
     
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        //Text("Item at \(item.DateStart, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.Note)
                        //                        Text(item.DateStart, format: Date.FormatStyle(date: .numeric, time: .standard))
//                            .fixedSize(horizontal: true, vertical: false)//https://www.reddit.com/r/SwiftUI/comments/wrytc1/why_is_my_text_wrapping_like_this_how_can_i_make/
                        Text("BI: " + String(item.BuyIn.description))
                            .fixedSize(horizontal: true, vertical: false)
                        Text(item.Running.description)
                            .fixedSize(horizontal: true, vertical: false)
                        Image(systemName: item.Running ? "checkmark.square.fill" : "checkmark.square")
                            .foregroundColor(.red)
                        Image("bb")
                            .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                    }
                    .listRowBackground(Color.cyan) // Uses Color
                    .onTapGesture {
                        globals.selectedGame = item
//                        settings.selectedGame = item
//                        settings.counter += 1
                        showModal.toggle()
                    }
                }
                .onDelete(perform: deleteItems)
            }.sheet(isPresented: $showModal )
            {
                    sheetEditGame()
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
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = game()
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

