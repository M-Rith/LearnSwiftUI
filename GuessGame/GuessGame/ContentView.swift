//
//  ContentView.swift
//  GuessGame
//
//  Created by USER on 3/1/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var correctAnswer = 0;
    @State var score = 0;
    @State var gameMessage = "?";
    @State var gameSubTitle = "Guess which is the right answer";
    
    func theRightAnswer(correctAnswer : Int) {
        switch correctAnswer {
        case 0 :
            gameSubTitle = "Dog is the correct answer"
        case 1 :
            gameSubTitle = "Cat is the correct answer"
        case 2 :
            gameSubTitle = "Fox is the correct answer"
        default:
            gameSubTitle = "Guess which is the right answer"
        }
        
    }
    
    func checkAnswer(answer: Int) {
        if answer == correctAnswer {
            score += 1
            gameMessage = "Success !"
        }
        else {
            if score != 0 {
                score -= 1
            }
            gameMessage = "Failed !"
            
        }
        theRightAnswer(correctAnswer: correctAnswer)
        
        randomizeCorrectAnswer()
    }
    
    func randomizeCorrectAnswer() {
        let randomCorrectAnswer = Int.random(in: 0..<3)
        correctAnswer = randomCorrectAnswer
    }
    
    var body: some View {
        VStack {
            Text(gameMessage)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 100)
            Text(gameSubTitle)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.bottom, 100)
            

            HStack {
                Spacer();
                Text("Score : \(score)")
                    .font(.body)
                    .fontWeight(.bold)
            }
            
            Button(action: {
                checkAnswer(answer: 0)
            }, label: {
                Image("dog")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            
            })
            
            
            Button(action: {
                checkAnswer(answer: 1)
            }, label: {
                Image("cat")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            
            })
            
            Button(action: {
                checkAnswer(answer: 2)
            }, label: {
                Image("fox")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            
            })
            Spacer()
        }.padding()
    }
}

#Preview {
    ContentView()
}
