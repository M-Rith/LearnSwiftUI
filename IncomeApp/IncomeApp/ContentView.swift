//
//  ContentView.swift
//  IncomeApp
//
//  Created by USER on 18/1/26.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject private var vm = TransactionsViewModel()
    
    @State private var isAddTransaction = false
    
    
    var body: some View {
        ZStack {
            
            VStack {
                BalanceView(vm: vm)
                
                List(vm.transactions.sorted { $0.date > $1.date }) { transaction in
                    TransactionView(transaction: transaction)
                }
                .scrollContentBackground(.hidden)
            }
            
            FloatingButtonView(isAddTransaction: $isAddTransaction)
            
        }.padding(.top, 40)
        .sheet(isPresented: $isAddTransaction, content: {
            AddTransactionView(vm: vm)
                .presentationDetents([.large])
        })
        
    
    }
}

#Preview {
    ContentView()
}
