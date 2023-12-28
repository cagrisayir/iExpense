//
//  ContentView.swift
//  iExpense
//
//  Created by Omer Cagri Sayir on 26.12.2023.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    @StateObject var expenses = Expenses()

    @State private var showingAddExpense = false

    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpense, content: {
            AddView(expenses: expenses)
        })
        
    }
}

#Preview {
    ContentView()
}
