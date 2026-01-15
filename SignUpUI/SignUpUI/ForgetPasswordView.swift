//
//  ForgetPasswordView.swift
//  SignUpUI
//
//  Created by USER on 13/1/26.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var email = ""
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack (alignment: .leading) {
                VStack (alignment: .leading, spacing: 0) {
                    Text("Forget your password")
                        .foregroundStyle(.main)
                        .fontWeight(.bold)
                        .font(.title2)
                    
                    Text("Please input your email to verify")
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
                
                Button(action: {
                    print("Veritfy")
                }, label: {
                    Text("Verify")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(.main)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                })
                
                Spacer()
        }
            .padding(.horizontal, 24)

                
            
        }
        .toolbarRole(.editor)
        

        

    
            

    }
}

#Preview {
    ForgetPasswordView()
}
