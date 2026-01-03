//
//  ContentView.swift
//  GuessTheWordsGame
//
//  Created by USER on 3/1/26.
//

import SwiftUI

struct ContentView: View {
    
    var randomWords = ["apple", "river", "cloud", "mirror", "lantern", "forest", "whisper", "stone", "planet", "shadow", "feather", "window", "coffee", "breeze", "mountain"]
    
    var character = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M","N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    var userGuess = ""


    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello wrold")
                Text("Hell owrold")
                
            }
            .navigationTitle("Guess the word Game")
        }
    }
}

#Preview {
    ContentView()
}
