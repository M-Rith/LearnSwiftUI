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
    @State private var isEditTransaction = false
    @State private var selectedTransaction: Transaction? = nil

    var body: some View {
        ZStack {
            VStack {
                BalanceView(vm: vm)

                List(vm.transactions.sorted { $0.date > $1.date }) { transaction in
                    TransactionView(transaction: transaction)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                vm.deleteTransaction(transaction: transaction)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }

                            Button {
                                selectedTransaction = transaction
                                isEditTransaction = true
                                isAddTransaction = true
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(.blue)
                        }
                }
                .scrollContentBackground(.hidden)
            }

            FloatingButtonView(isAddTransaction: $isAddTransaction)
        }
        .padding(.top, 40)
        .sheet(isPresented: $isAddTransaction, onDismiss: {
            isEditTransaction = false
            selectedTransaction = nil
        }) {
            AddTransactionView(
                vm: vm,
                isEdit: $isEditTransaction,
                transactionToEdit: selectedTransaction
            )
            .presentationDetents([.large])
        }
    }
}

#Preview {
    ContentView()
}
