//
//  SignUpScreen.swift
//  ToDo
//
//  Created by Mayank Singh on 01/04/25.
//

import Foundation
import SwiftUI



struct SignUpScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    
    @State var userName = ""
    @State var userEmail = ""
    @State var userPassword = ""
    @State var confirmPassword = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Button(action: {
                print("Button tapped!")
                dismiss()
            }) {
                Image("back")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.red)
            }
            
            Text("Sign up with Email")
                .font(.custom("Caros Bold", size: 21))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 40)
            
            Text("Get chatting with friends and family today by\n signing up for our chat app!")
                .font(.custom("Caros Medium", size: 14))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 16)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(hex:"#797C7B"))
            
            Text("Your Name")
                .font(.custom("Caros Medium", size: 14))
                    .foregroundColor(Color(hex: "24786D"))
                    .padding(.top, 24)
                

            TextField("Enter your text here", text: $userName)
                .padding(.vertical, 12)
            
            if(userName.isEmpty) {
                Divider()
                    .background(Color.gray)
                    .frame(height: 1)
            }
            
            
            Text("Your email")
                .font(.custom("Caros Medium", size: 14))
                    .foregroundColor(Color(hex: "24786D"))
                    .padding(.top, 24)
                

            TextField("Enter your text here", text: $userEmail)
                .padding(.vertical, 12)
            
            if(userEmail.isEmpty) {
                Divider()
                    .background(Color.gray)
                    .frame(height: 1)
            }
            
            Text("Password")
                .font(.custom("Caros Medium", size: 14))
                    .foregroundColor(Color(hex: "24786D"))
                    .padding(.top, 24)
                

            TextField("Enter your text here", text: $userPassword)
                .padding(.vertical, 12)
            
            if(userPassword.isEmpty) {
                Divider()
                    .background(Color.gray)
                    .frame(height: 1)
            }
            
            
            Text("Confirm Password")
                .font(.custom("Caros Medium", size: 14))
                    .foregroundColor(Color(hex: "24786D"))
                    .padding(.top, 24)
                

            TextField("Enter your text here", text: $confirmPassword)
                .padding(.vertical, 12)
            
            if(confirmPassword.isEmpty) {
                Divider()
                    .background(Color.gray)
                    .frame(height: 1)
            }
            
            Spacer()
            
            Button("Create an account", action: { })
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color(hex: "F3F6F6"))
                .cornerRadius(16)
                .font(.custom("Caros Bold", size: 16))
                .foregroundColor(Color(hex:"#797C7B"))
            
            
            
            
        }.padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
            //.navigate(to: SignUpScreen(), when: $willMoveToSignUpScreen)
        
        
    }
}

#Preview {
    SignUpScreen()
}
