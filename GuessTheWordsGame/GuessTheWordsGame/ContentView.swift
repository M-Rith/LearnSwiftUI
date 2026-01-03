//
//  ContentView.swift
//  GuessTheWordsGame
//
//  Created by USER on 3/1/26.
//

import SwiftUI

struct ContentView: View {
    
    var randomWords = ["apple", "river", "cloud", "mirror", "lantern", "forest", "whisper", "stone", "planet", "shadow", "feather", "window", "coffee", "breeze", "mountain"]
    
    var characters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M","N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    let columns = Array(repeating: GridItem(.flexible()), count: 6)
    
    @State var userGuess = ""
    @State var guessWord = ""
    
    @State private var wrongCharacter: [String] = []
    
    func getRandomWord() {
        let randomNumber = Int.random(in: 0..<15)
        guessWord = randomWords[randomNumber]
        userGuess = String(repeating: "_ ", count: guessWord.count)
        
    }
    
    func onTap(letter: String) {
        print(guessWord)
        print("Here is the letter")
        print(letter)
        if guessWord.contains(letter.lowercased()){
            print("True")
        }
        else {
            wrongCharacter.append(letter)
        }
        print(wrongCharacter)
    }

    
    var body: some View {
        NavigationStack {
            VStack (alignment: .center) {
                Text(userGuess)
                
                Button(action: {
                    getRandomWord()
                }, label: {
                    Text("Started")
                })
                if (guessWord != "") {
                    LazyVGrid(columns: columns, spacing: 12) {
                          ForEach(characters, id: \.self) { letter in
                              Text(letter)
                                 .font(.title)
                                 .frame(width: 50, height: 50)
                                 .background(wrongCharacter.contains(letter) ? Color.red.opacity(0.2) : Color.blue.opacity(0.2))
                                 .cornerRadius(8)
                                 .onTapGesture {
                                     if !wrongCharacter.contains(letter) {
                                         onTap(letter: letter)
                                     }
                                     
                                 }
                          }
                      }
                }
                
                
                Text(guessWord)
                
            }.padding()
            .navigationTitle("Guess the word Game")
        }
    }
}

#Preview {
    ContentView()
}
