//
//  Expenses.swift
//  iExpense
//
//  Created by Omer Cagri Sayir on 27.12.2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
