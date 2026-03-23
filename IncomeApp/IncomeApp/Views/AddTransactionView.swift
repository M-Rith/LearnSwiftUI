//
//  AddTransactionView.swift
//  IncomeApp
//
//  Created by USER on 18/1/26.
//

import SwiftUI

struct AddTransactionView: View {
    
    @State private var title = "";
    @State private var amount: Double? = nil
    @State private var note = "";
    @State private var type: TransactionType = .expense
    @State private var date: Date = Date()

    @ObservedObject var vm: TransactionsViewModel
    
    @Environment(\.dismiss) private var dismiss

    
    func addTransaction() {
        guard let amount = amount else { return }

        let transaction = Transaction(
            title: title,
            amount: amount,
            date: date,
            type: type,
            note: note
        )
        vm.addNewTransaction(newTransaction: transaction)

        dismiss()
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Add Transaction")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {
                    addTransaction()
                }, label: {
                    Text("Add")
                })
                .disabled(title=="" || amount == nil)
                
            }.padding(.bottom, 50)
            
            
            HStack {
                Spacer()
                TextField("0.00", value: $amount, format: .number)
                   .font(.system(size: 50))
                   .fontWeight(.semibold)
                   .multilineTextAlignment(.center)
                   .keyboardType(.decimalPad)
                   .frame(width: 200)
                
                Spacer()
            }
            
            VStack (alignment: .leading, spacing: 5) {
                HStack (spacing: 5){
                    Text("Title")
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text("*")
                        .font(.caption)
                        .foregroundStyle(.red)
                
                    
                }
                
                TextField("Enter title of transaction", text: $title)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.alphabet)

            }.padding(.bottom, 20)
            
            HStack {
                
                Text("Type : ")
                    .font(.caption)
                    .fontWeight(.semibold)
                Spacer()
                
                Picker("Type", selection: $type) {
                    ForEach(TransactionType.allCases) { transation in
                        Text(transation.title)
                    }
                }
            }.padding(.bottom, 20)
            VStack {
                DatePicker(selection: $date, displayedComponents: .date, label: {
                    Text("Date")
                })
            }
            VStack (alignment: .leading, spacing: 5) {
                Text("Note")
                    .font(.caption)
                    .fontWeight(.semibold)
                TextField("Enter title of transaction", text: $note)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.alphabet)
            }.padding(.bottom, 20)
            
            Spacer()
        }
        .padding()
        .padding(.top, 20)
    }
}
