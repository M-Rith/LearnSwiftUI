//
//  ContentView.swift
//  IncomeApp
//
//  Created by USER on 18/1/26.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var transactions : [Transaction] = [
        Transaction(title: "Apple", amount: 5.0, date: Date(), type: .expense),
        Transaction(title: "Salry", amount: 1500.0, date: Date(), type: .income)
    ]
    
    var body: some View {
        VStack {
            BalanceView()

            List(transactions) { transaction in
                TransactionView(transaction: transaction)
            
            }.scrollContentBackground(.hidden)
        }.padding(.top, 40)
    }
}

#Preview {
    ContentView()
}
