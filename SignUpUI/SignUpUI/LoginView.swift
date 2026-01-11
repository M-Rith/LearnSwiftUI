//
//  LoginView.swift
//  SignUpUI
//
//  Created by USER on 11/1/26.
//

import SwiftUI


struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @State private var showPassword = false
    
    @State private var loginStatus : LoginStatus = .idle
    @State private var showLoginError = false
    
    @StateObject private var keyboard = KeyboardObserver()
    
    
    func togglePasssword() {
        showPassword.toggle()
    }
    
    
    func login() {
        
        if (email == "hmonirith@gmail.com" && password == "12345") {
            loginStatus = .success
            showLoginError = false
        }
        else {
            loginStatus = .failure
            showLoginError = true
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                
                VStack (alignment: .leading) {
                    
                    VStack (alignment: .leading) {
                        Text("Hi, Welcome Back! 👋")
                            .foregroundStyle(.main)
                            .fontWeight(.bold)
                            .font(.title)
                        
                        Text("Hello again, you’ve been missed !")
                            .foregroundStyle(.grey)
                            .font(.caption)
                        
                    }
                    .padding(.bottom, 75)
                    .padding(.top, 25)
                    
                    
                    // Email
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
                    
                    
                    // Password
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
                        
                    }
                    
                    
                    Button(action: {}, label: {
                        Text("Forget Password")
                            .foregroundStyle(.main)
                            .fontWeight(.bold)
                            .font(.subheadline)
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, 30)
                    
                    Button(action: {
                        login()
                    }, label: {
                        Text("Login")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(.main)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    })
                    
                    HStack(alignment: .center , spacing: 12) {
                        Divider()
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .background(.white)
                        
                        Text("Or login with")
                            .font(.caption)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                        Divider()
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .background(.white)
                    }
                    
                    .padding(.vertical, 16)
                    
                    
                    Button(action: {
                        print("Login")
                    }) {
                        HStack(spacing: 12) {
                            Image("Google")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("Continue with Google")
                                .foregroundStyle(.black)
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Text("Dont have account ?")
                            .font(.subheadline)
                            .foregroundStyle(.white)

                        NavigationLink {
                            SignUpView()
                            
                        } label: {
                            Text("Sign Up")
                            .font(.subheadline)
                            .foregroundStyle(.main)
                            .fontWeight(.bold)
                        }
    
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
            }
            .alert("Failed", isPresented: $showLoginError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Invalid email or password")
            }
            .navigationBarBackButtonHidden(true)
            .interactiveDismissDisabled(true)
        }
    }

        
}

#Preview {
    LoginView()
}
