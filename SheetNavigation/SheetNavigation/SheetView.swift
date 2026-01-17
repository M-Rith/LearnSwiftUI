//
//  SheetView.swift
//  SheetNavigation
//
//  Created by USER on 17/1/26.
//

import SwiftUI

struct SheetView: View {
    
//    @Environment(\.dismiss) var dismiss
    @Binding var showSheet : Bool
    
    var body: some View {
        Text("This is sheets")
        
        Button(action: {
            showSheet = false
        }, label: {
            Text("Close")
        })
    }
}

#Preview {
    SheetView(showSheet: .constant(true))
}
