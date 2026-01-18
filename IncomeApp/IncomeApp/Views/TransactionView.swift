//
//  TransactionView.swift
//  IncomeApp
//
//  Created by USER on 18/1/26.
//

import SwiftUI

struct TransactionView: View {
    
    var transaction : Transaction;
    
    var body: some View {
        HStack (alignment: .center) {
            Image(systemName: transaction.type == .expense ? "arrow.down.forward" : "arrow.up.forward")
                .foregroundStyle(transaction.type == .expense ? .red : .green)
                .fontWeight(.bold)
                .font(.caption)
            
            Text(transaction.title)
                .font(.title3)
                .fontWeight(.bold)
            Spacer()
            VStack {
                Text(transaction.amount, format: .currency(code: "JPY"))
                Text(transaction.date, style: .date)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
            }
            
        }
    }
}

#Preview {
    TransactionView(transaction: Transaction(title: "Apple", amount: 5.0, date: Date(), type: .expense))
}
