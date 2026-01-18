//
//  TransactionViewModel.swift
//  IncomeApp
//
//  Created by USER on 18/1/26.
//
import Foundation

final class TransactionsViewModel: ObservableObject {
    
    @Published var transactions: [Transaction] = [
        Transaction(title: "Apple", amount: 5.0, date: .now, type: .expense, note: "Testing"),
        Transaction(title: "Salary", amount: 1200, date: .now, type: .income, note: "Testing")
    ]
    
}
