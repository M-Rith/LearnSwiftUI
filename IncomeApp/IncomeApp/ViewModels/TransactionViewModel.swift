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
    
    var totalExpense: Double {
        transactions
            .filter { $0.type == .expense }
            .reduce(0) { $0 + $1.amount }
    }

    var totalIncome: Double {
        transactions
            .filter { $0.type == .income }
            .reduce(0) { $0 + $1.amount }
    }

    var remainingMoney: Double {
        totalIncome - totalExpense
    }
    
    
    
    func addNewTransaction(newTransaction : Transaction){
        transactions.append(newTransaction)
    }

    
}
