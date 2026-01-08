//
//  ContentView.swift
//  learnSwiftUI
//
//  Created by USER on 5/1/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        HStack (alignment : .bottom ,spacing: 0) {
//            Image("apple")
//                .border(.red)
//            Text("apple")
//                .border(.black, width: 1)
//        }
//        .frame(width: 300, height: 300, alignment: .topLeading)
//        .border(.black)
        
//        GeometryReader(content: {
//            geomery in
//            VStack {
//                Text("Hello world")
//            }
//        })
        Text("Testing dwadawdawdawdawdawfawdwfawgafawdaw")
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.red)
            .multilineTextAlignment(.center)
       
    }
}

#Preview {
    ContentView()
}
