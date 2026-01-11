//
//  SignUpView.swift
//  SignUpUI
//
//  Created by USER on 11/1/26.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                
                VStack (alignment: .leading)  {

                    VStack (alignment: .leading) {
                        Text("Become one of us 🤘")
                            .foregroundStyle(.main)
                            .fontWeight(.bold)
                            .font(.title)
                        
                        Text("Start to have a better conversation today !")
                            .foregroundStyle(.grey)
                            .font(.caption)
                        
                    }
                    .padding(.bottom, 75)
                    .padding(.top, 25)
                    
                    
                    VStack (alignment: .leading, spacing: 5) {
                        Text("Email address")
                            .font(.caption)
                            .foregroundStyle(.white)
                        HStack(spacing: 12) {
                            Image(systemName: "envelope")
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                            
                            TextField(text: $email, label: {
                                Text("Enter your email")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            })
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                        }
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 1)
                        
                    }.padding(.bottom, 20)
                    
                    Spacer()
                    
                    
                    HStack {
                        Spacer()
                        Text("Already have an account ? ")
                            .font(.subheadline)
                            .foregroundStyle(.white)

                        NavigationLink {
                            LoginView()
                            
                        } label: {
                            Text("Login")
                            .font(.subheadline)
                            .foregroundStyle(.main)
                            .fontWeight(.bold)
                        }

                        
                        Spacer()
                    }
                }
                .navigationBarBackButtonHidden(true)
                .interactiveDismissDisabled(true)
                .padding(.horizontal, 24)
                .padding(.top, 24)
            }
        }
    }
}

#Preview {
    SignUpView()
}
