//
//  AddView.swift
//  iExpense
//
//  Created by Omer Cagri Sayir on 28.12.2023.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0

    @ObservedObject var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss

    let types = ["Business", "Personal"]

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }.toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }.navigationTitle("Add new expense")
    }
}

#Preview {
    AddView(expenses: Expenses())
}
