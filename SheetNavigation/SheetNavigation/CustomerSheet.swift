//
//  CustomerSheet.swift
//  SheetNavigation
//
//  Created by USER on 18/1/26.
//

import SwiftUI

struct CustomerSheet: View {
    
    let selectCustomer: CustomerModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack{
            Button(action: {
                dismiss()
            }, label: {
                Text("Close")
            })
            Text(selectCustomer.name)
            Text("\(selectCustomer.age)")
            
        }

    }
}

#Preview {
    CustomerSheet(selectCustomer: CustomerModel(name: "Rith", age: 25))
}
