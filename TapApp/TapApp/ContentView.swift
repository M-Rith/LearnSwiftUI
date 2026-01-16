//
//  ContentView.swift
//  TapApp
//
//  Created by USER on 16/1/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var possibleOutcome = ["apple", "dog", "egg"]
    
    @State var index = 0
    var body: some View {
        VStack {
            Image(possibleOutcome[index])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                
        }.onReceive(timer, perform: { _ in
            if (possibleOutcome.count - 1 == index) {
                index = 0
            }
            else {
                index += 1
            }
            
        })
    }
}

#Preview {
    ContentView()
}
