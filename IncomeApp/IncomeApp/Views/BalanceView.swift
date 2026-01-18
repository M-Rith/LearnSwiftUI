//
//  BalanceView.swift
//  IncomeApp
//
//  Created by USER on 18/1/26.
//

import SwiftUI

struct BalanceView: View {
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
                
                Text("2$")
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
                        Text("10$")
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
                        Text("10$")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                    }
                    Spacer()
                }
                Spacer()
            }.padding()
        }
        .frame(width: .infinity, height: 100)
        .padding(.horizontal)
    }
}

#Preview {
    BalanceView()
}
