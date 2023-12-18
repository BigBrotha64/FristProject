//
//  ContentView.swift
//  FristProject
//
//  Created by Alexander Kemp on 23/9/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    @State var isTextShowing = true
    
    var body: some View {
        
        VStack {
            if isTextShowing {
                Text("This is my app to test changes in Xcode15-2 mit github  ")
                    .padding()
            } else {
                Text("empty")
                    .padding()
                    .font(.title)
            }
            Button("Alex Button") {
                isTextShowing.toggle()
                    
            }
        }
  /*      NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        
                            Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
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
   */
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
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

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
