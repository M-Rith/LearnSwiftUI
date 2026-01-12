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
    
    @State private var showPassword = false
    @Environment(\.dismiss) private var dismiss
    
    @State private var loginStatus : LoginStatus = .idle
    @State private var showLoginError = false
    
    @StateObject private var keyboard = KeyboardObserver()
    
    
    func togglePasssword() {
        showPassword.toggle()
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                
                VStack (alignment: .leading)  {

                    VStack (alignment: .leading, spacing: 0) {
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
                    
                    VStack (alignment: .leading, spacing: 5)   {
                        Text("Password")
                            .font(.caption)
                            .foregroundStyle(.white)
                        HStack(spacing: 12) {
                            Image(systemName: "lock")
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                            
                            
                            if showPassword {
                                TextField(text: $password, label: {
                                    Text("Enter your password")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                })
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                                .frame(height: 30)
                            }
                            else {
                                SecureField(text: $password, label: {
                                    Text("Enter your password")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                })
                                .foregroundStyle(.white)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                                .frame(height: 30)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                togglePasssword()
                            }, label: {
                                Image(systemName: showPassword ? "eye.slash" : "eye")  .foregroundColor(.white)
                                    .font(.system(size: 18))
                            })
                        }
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 1)
                        
                    }.padding(.bottom, 30)
                    
                    
                    Button(action: {
                        print("Sign ip")
                    }, label: {
                        Text("Sign up")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(.main)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    })
                    
                    Spacer()
                    
                    
                    HStack {
                        Spacer()
                        Text("Already have an account ? ")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                        
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Login")
                            .font(.subheadline)
                            .foregroundStyle(.main)
                            .fontWeight(.bold)
                        })

                        
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
