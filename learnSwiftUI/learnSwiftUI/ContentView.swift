//
//  ContentView.swift
//  learnSwiftUI
//
//  Created by USER on 5/1/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello world")
            ZStack {
                Rectangle()
                Text("Hello world")
                    .foregroundStyle(.white)
            }
            
        }
       
    }
}

#Preview {
    ContentView()
}
