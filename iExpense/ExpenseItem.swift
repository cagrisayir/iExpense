//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Omer Cagri Sayir on 27.12.2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
