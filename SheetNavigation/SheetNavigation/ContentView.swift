//
//  ContentView.swift
//  SheetNavigation
//
//  Created by USER on 17/1/26.
//

import SwiftUI

struct ContentView: View {
    
    
    var customerList: [CustomerModel] = [
        CustomerModel(name: "Rith", age: 25),
        CustomerModel(name: "Ka", age: 24)
    ]
    
    @State private var isShowSheet = false;
    
    @State private var selectedCustomer: CustomerModel? = nil
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isShowSheet = true;
                }, label: {
                    Text("Open Sheets")
                })
                Spacer()
            }
            
            List(customerList) { customer in
                HStack {
                    VStack {
                        Text(customer.name)
                        Text("\(customer.age)")
                    }
                    Spacer()
                    Button(action: {
                        selectedCustomer = customer
                    }, label: {
                        Text("Detail")
                    })
                    
                    
                }
            }
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $isShowSheet, content: {
            SheetView(showSheet: $isShowSheet)
        })
        .sheet(item: $selectedCustomer) { customer in
            CustomerSheet(selectCustomer: customer)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    ContentView()
}
