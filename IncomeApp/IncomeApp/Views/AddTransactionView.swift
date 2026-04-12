//
//  AddTransactionView.swift
//  IncomeApp
//
//  Created by USER on 18/1/26.
//

import SwiftUI

struct AddTransactionView: View {
    @State private var title = ""
    @State private var amount: Double? = nil
    @State private var note = ""
    @State private var type: TransactionType = .expense
    @State private var date: Date = Date()

    @ObservedObject var vm: TransactionsViewModel
    @Binding var isEdit: Bool
    let transactionToEdit: Transaction?

    @Environment(\.dismiss) private var dismiss

    func saveTransaction() {
        guard let amount = amount else { return }

        let transaction = Transaction(
            title: title,
            amount: amount,
            date: date,
            type: type,
            note: note
        )


        if isEdit {
            vm.editTransaction(transaction: transaction, id: transactionToEdit.id as UUID)
        } else {
            vm.addNewTransaction(newTransaction: transaction)
        }

        dismiss()
    }

    var body: some View {
        VStack {
            HStack {
                Text(isEdit ? "Edit Transaction" : "Add Transaction")
                    .font(.title)
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    saveTransaction()
                } label: {
                    Text(isEdit ? "Save" : "Add")
                }
                .disabled(title.isEmpty || amount == nil)
            }
            .padding(.bottom, 50)

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

            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 5) {
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
            }
            .padding(.bottom, 20)

            HStack {
                Text("Type : ")
                    .font(.caption)
                    .fontWeight(.semibold)

                Spacer()

                Picker("Type", selection: $type) {
                    ForEach(TransactionType.allCases) { transaction in
                        Text(transaction.title)
                            .tag(transaction)
                    }
                }
            }
            .padding(.bottom, 20)

            DatePicker("Date", selection: $date, displayedComponents: .date)

            VStack(alignment: .leading, spacing: 5) {
                Text("Note")
                    .font(.caption)
                    .fontWeight(.semibold)

                TextField("Enter note", text: $note)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.bottom, 20)

            Spacer()
        }
        .padding()
        .padding(.top, 20)
        .onAppear {
            if isEdit, let transaction = transactionToEdit {
                title = transaction.title
                amount = transaction.amount
                note = transaction.note
                type = transaction.type
                date = transaction.date
            }
        }
    }
}
