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
    
    @State var life = 5;
    @State private var wrongCharacter: [String] = []
    
    func getRandomWord() {
        wrongCharacter = []
        let randomNumber = Int.random(in: 0..<15)
        guessWord = randomWords[randomNumber]
        userGuess = String(repeating: "_ ", count: guessWord.count)
        
    }
    
    func onTap(letter: String) {
        let lowerLetter = letter.lowercased()
        let wordArray = Array(guessWord)
        var guessArray = userGuess.split(separator: " ").map(String.init)

        var isCorrect = false

        for (index, char) in wordArray.enumerated() {
            if String(char) == lowerLetter {
                guessArray[index] = letter
                isCorrect = true
            }
        }

        if isCorrect {
            userGuess = guessArray.joined(separator: " ")
        } else {
            if !wrongCharacter.contains(letter) {
                life -= 1
                wrongCharacter.append(letter)
            }
        }
    }
    
    func tryAgain() {
        life = 5
        getRandomWord()
    }


    
    var body: some View {
        NavigationStack {
            VStack (alignment: .center) {
                if (life > 0) {
                    if (guessWord == "") {
                        Text("You have \(life) hearts")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Each wrong guess will lose 1 heart")
                            .font(.headline)
                        Text("You lose when heart each 0")
                            .font(.headline)
                    
                        Button(action: {
                            getRandomWord()
                        }, label: {
                            Text("Started")
                        })
                        .padding(.top, 100)
                        .padding(.bottom, 100)
                    }
                    else {
                        if (guessWord.lowercased() == userGuess
                            .replacingOccurrences(of: " ", with: "")
                            .lowercased()) {
                            VStack {
                                Text("You win")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text("You have \(life) remaining")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                
                                Button(action: {
                                    tryAgain()
                                }, label: {
                                    HStack {
                                        Image(systemName: "arrow.clockwise")
                                        Text("Play Again ?")
                                    }
                                }).padding(.top, 100)
                            }
                            
                        }
                        else {
                            VStack {
                                HStack {
                                    Spacer()
                                    Text("❤️ \(life) Remaining")
                                }.padding(.bottom, 50)
                                
                                Text(userGuess)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.bottom, 50)
                                LazyVGrid(columns: columns, spacing: 12) {
                                      ForEach(characters, id: \.self) { letter in
                                          Text(letter)
                                             .font(.title)
                                             .frame(width: 50, height: 50)
                                             .background(
                                                wrongCharacter.contains(letter) ? Color.red.opacity(0.2) : userGuess.contains(letter) ? Color.green.opacity(0.2) : Color.blue.opacity(0.2))
                                             .cornerRadius(8)
                                             .onTapGesture {
                                                 if !wrongCharacter.contains(letter) || !userGuess.contains(letter) {
                                                     onTap(letter: letter)
                                                 }
                                                 
                                             }
                                      }
                                  }
                                
                            }
                        }
                        
                    }
                    
                }
                else {
                    Text("You lose")
                        .font(.title)
                    Text("The right word is : \(guessWord) ")
                        .font(.title3)
                        .fontWeight(.bold)
      
                    Button(action: {
                        tryAgain()
                    }, label: {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                            Text("Try again")
                        }
                    })
                    .padding(.top, 100)
                    
                }
            }.padding()
                .navigationTitle("Guess the word")
            
        }
    }
}

#Preview {
    ContentView()
}
