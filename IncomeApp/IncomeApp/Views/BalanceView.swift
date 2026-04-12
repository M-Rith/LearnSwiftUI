//
//  BalanceView.swift
//  IncomeApp
//
//  Created by USER on 18/1/26.
//

import SwiftUI

struct BalanceView: View {
    
    @ObservedObject var vm: TransactionsViewModel
    
    var expense: Double {
        vm.totalExpense
    }
    
    var income: Double {
        vm.totalIncome
    }
    
    var remaining: Double {
        vm.remainingMoney
    }
    
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(.bg)
            VStack (alignment: .leading ){
                HStack {
                    Text("BALANCE")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                    Spacer()
                }
                
                Text(remaining, format: .currency(code: "JPY"))
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                HStack(spacing: 30) {
                    VStack (alignment: .leading) {
                        HStack {
                            Image(systemName: "arrow.up.right.circle.fill")
                                .font(.subheadline)
                                .foregroundStyle(.accent)
                            Text("Expenses")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                        }
                        Text(expense, format: .currency(code: "JPY"))
                            .foregroundStyle(.white)
                            .font(.subheadline)
                    }
                    
                    VStack (alignment: .leading, spacing: 0) {
                        HStack {
                            Image(systemName: "arrow.down.backward.circle.fill")
                                .font(.subheadline)
                                .foregroundStyle(.main)
                            Text("Income")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                        }
                        Text(income, format: .currency(code: "JPY"))
                            .foregroundStyle(.white)
                            .font(.subheadline)
                    }
                    Spacer()
                }
                Spacer()
            }.padding()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .padding(.horizontal)
        .shadow(radius: 10, x: 0, y:5)
    }
}
