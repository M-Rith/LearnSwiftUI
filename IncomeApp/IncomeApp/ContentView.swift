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
                BalanceView()
                
                List(vm.transactions) { transaction in
                    TransactionView(transaction: transaction)
                    
                }.scrollContentBackground(.hidden)
            }
            
            FloatingButtonView(isAddTransaction: $isAddTransaction)
            
        }.padding(.top, 40)
        .sheet(isPresented: $isAddTransaction, content: {
            AddTransactionView()
                .presentationDetents([.large])
        })
        
    
    }
}

#Preview {
    ContentView()
}
