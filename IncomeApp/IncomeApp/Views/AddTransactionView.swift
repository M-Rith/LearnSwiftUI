//
//  AddTransactionView.swift
//  IncomeApp
//
//  Created by USER on 18/1/26.
//

import SwiftUI

struct AddTransactionView: View {
    
    @State private var title = "";
    
    @State private var type: TransactionType = .expense
    
    @State private var date: Date = Date()
    
    var body: some View {
        VStack {
            HStack {
                Text("Add Transaction")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {
                    print(date)
                    print(type)
                }, label: {
                    Text("Add")
                })
            }.padding(.bottom, 50)
            
            
            HStack {
                Spacer()
                Text("Hello world")
                Spacer()
            }
            
            VStack (alignment: .leading, spacing: 5) {
                Text("Title")
                    .font(.caption)
                    .fontWeight(.semibold)
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
                DatePicker(
                    "Select date",
                    selection: $date,
                    displayedComponents: .date
                )
                .datePickerStyle(.compact)
            }
            
            VStack (alignment: .leading, spacing: 5) {
                Text("Note")
                    .font(.caption)
                    .fontWeight(.semibold)
                TextField("Enter title of transaction", text: $title)
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

#Preview {
    AddTransactionView()
}
