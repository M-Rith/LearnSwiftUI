//
//  ContentView.swift
//  learnSwiftUI
//
//  Created by USER on 5/1/26.
//

import SwiftUI

//struct ContentView: View {
//    
//    @State var counter = 0;
//    
//    func add() {
//        counter += 1
//    }
//    func sub() {
//        if (counter > 0) {
//            counter -= 1
//        }
//    }
//    
//    var body: some View {
////        HStack (alignment : .bottom ,spacing: 0) {
////            Image("apple")
////                .border(.red)
////            Text("apple")
////                .border(.black, width: 1)
////        }
////        .frame(width: 300, height: 300, alignment: .topLeading)
////        .border(.black)
//        
////        GeometryReader(content: {
////            geomery in
////            VStack {
////                Text("Hello world")
////            }
////        })
////        Text("Testing dwadawdawdawdawdawfawdwfawgafawdaw")
////            .font(.title)
////            .fontWeight(.bold)
////            .foregroundStyle(.red)
////            .multilineTextAlignment(.center)
//        
////        Image(systemName: "person.circle")
////            .font(.largeTitle)
//        
////        Image("tree")
////            .resizable()
////            .aspectRatio(contentMode: .fit)
////            .frame(maxWidth: .infinity, maxHeight: .infinity )
////        
////        Image("blackTree", bundle: nil)
////            .resizable()
////            .aspectRatio(contentMode: .fit)
////            .foregroundStyle(.red)
////            .frame(width :100, height: 100)
////            .border(.black)
//        
////        VStack (spacing: 10) {
//////            Color.primaryTheme
//////            Rectangle()
//////                .frame(width: 250, height: 50)
//////                .foregroundStyle(.red)
//////                .border(.black, width: 10)
//////            
//////            RoundedRectangle(cornerRadius : 10)
//////                .frame(width: 250, height: 50)
////            
////            Button("Tap me", action: {
////                print("Hello")
////            })
////            Button(role: .cancel, action: {
////                print("Tapped")
////            }) {
////                Text("Hello world")
////            }
////        }
//        
//        VStack (spacing: 10) {
//            Text("\(counter)")
//                .font(.title)
//                .fontWeight(.bold)
//            CounterView(count: $counter)
//
//            
//            
//            
//        }
//      
//        
//            
//       
//    }
//}
//
//
//struct CounterView: View {
//    @Binding var count: Int
//
//    var body: some View {
//        HStack(spacing: 20) {
//            Button("Increase") {
//                count += 1
//            }
//            Button("Decrease") {
//                if count > 0 { count -= 1 }   // optional safety
//            }
//        }
//    }
//}


struct ContentView : View {
    
    @State private var userName = ""
    @State private var email = ""
    @State private var password = ""
    
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            Color.primaryTheme.ignoresSafeArea()
            
            VStack (alignment: .leading, spacing: 10) {
                
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.bold)
                
                
                
                Text("Username")
                    .font(.caption)
                TextField("Username", text: $userName)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.username)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                
                Text("Email")
                    .font(.caption)
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                Text("Password")
                    .font(.caption)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.password)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                
                
                Button(action: {
                    showAlert = true
                }, label: {
                    Text("Submit")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 35)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                .padding(.top, 40)
                    
                
                Spacer()
                
            }
            .padding()
            
        }
        .alert("Sign up complete", isPresented: $showAlert) {
            Button("Okay", action : {
                showAlert = false
            })
        } message: {
            Text("Thank you for Register ")
        }
    }
}

#Preview {
    ContentView()
}

