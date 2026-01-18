//
//  TransactionType.swift
//  IncomeApp
//
//  Created by USER on 18/1/26.
//


import Foundation

enum TransactionType : String , CaseIterable, Identifiable {
    case income, expense
    
    var id : Self {self}
    
    var title : String {
        switch self {
            case .income :
                return "Income"
            case .expense :
                return "Expense"
        }
    }
}
