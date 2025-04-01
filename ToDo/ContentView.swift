//
//  ContentView.swift
//  ToDo
//
//  Created by Mayank Singh on 01/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var willMoveToLoginScreen = false
    @State var willMoveToSignUpScreen = false

 
    var body: some View {
        
        VStack  {
         Text("Splash Screen")
            
            HStack {
                Button("Log In", action: {
                    print("Login Tapped")
                    willMoveToLoginScreen = true
                })
                    .padding(.horizontal, 18)
                    .padding(.vertical, 10)
                    .background(.gray)
                    .cornerRadius(8)
                    .font(.custom("Caros Bold", size: 16))
                    .foregroundColor(Color.black)
                    .padding(.top, 16)
                
                
                Button("Sign Up", action: {
                    print("SignUp Tapped")
                    willMoveToSignUpScreen = true })
                    .padding(.horizontal, 18)
                    .padding(.vertical, 10)
                    .background(.gray)
                    .cornerRadius(8)
                    .font(.custom("Caros Bold", size: 16))
                    .foregroundColor(Color.black)
                    .padding(.top, 16)
                
            }
          
        
        }.navigate(to: LoginScreen(), when: $willMoveToLoginScreen)
           .navigate(to: SignUpScreen(), when: $willMoveToSignUpScreen)

        
    }
}

#Preview {
    ContentView()
}
