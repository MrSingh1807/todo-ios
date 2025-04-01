//
//  LoginScreen.swift
//  ToDo
//
//  Created by Mayank Singh on 01/04/25.
//

import Foundation
import SwiftUI


struct LoginScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var willMoveToSignUpScreen = false
    @State var willLandOnHomeScreen = false
    
    @State var userEmail = ""
    @State var userPassword = ""
    
    @State var toastMessage = ""
    @State var showToast = false

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
            
            
            Text("Log in to Todo App")
                .font(.custom("Caros Medium", size: 18))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 40)
            
            Text("Welcome back! Sign in using your social account or email to continue us")
                .font(.custom("Caros Medium", size: 18))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 16)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(hex:"#797C7B"))
            
            HStack(spacing: 20) {
                Button(action: {
                    print("Facebook tapped!")
                }) {
                    Image("fb_round")
                        .resizable()
                        .frame(width: 48, height: 48)
                }
                Button(action: {
                    print("Google tapped!")
                }) {
                    Image("google_round")
                        .resizable()
                        .frame(width: 48, height: 48)
                }
                Button(action: {
                    print("Apple tapped!")
                }) {
                    Image("apple_round")
                        .resizable()
                        .frame(width: 48, height: 48)
                }
                
            }.frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 30)
            
            
            HStack {
                VStack{    Divider()
                        .background(Color.gray)
                    .frame(height: 1)}
                
                
                Text("OR")
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                VStack{ Divider()
                        .background(Color.gray)
                    .frame(height: 1)}
            }.frame(maxWidth: .infinity, alignment: .center)
                .padding()
            
            Text("Your email")
                    .foregroundColor(Color(hex: "24786D"))
                    .padding(.top, 24)
                

            TextField("", text: $userEmail)
            
            if(userEmail.isEmpty) {
                Divider()
                    .background(Color.gray)
                    .frame(height: 1)
            }
            
            Text("Your email")
                    .foregroundColor(Color(hex: "24786D"))
                    .padding(.top, 24)
                

            TextField("", text: $userPassword)
    
            
            if(userPassword.isEmpty) {
                Divider()
                    .background(Color.gray)
                    .frame(height: 1)
            }
            Spacer()
            
        
            Button("Login", action: {
                let email = UserDefaults.standard.string(forKey: StorageKeys.userEmail.rawValue) ?? ""
                let password = UserDefaults.standard.string(forKey: StorageKeys.userPassword.rawValue) ?? ""
                print("UserName : \(email)\n")
                print("Password : \(password)")
                
                
                if(userEmail.isEmpty  || userEmail != email) {
                    toastMessage = "Email is not found"
                    showToastWithDelay()
                    return
                }
                
                if(userPassword.isEmpty || userPassword != password ) {
                    toastMessage = "Password is not found"
                    showToastWithDelay()
                }
                
                if(!showToast) {
                    toastMessage = "Logged in Successfully"
                    showToastWithDelay()
                    willLandOnHomeScreen = true
                }
                
            })
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color(hex: "F3F6F6"))
                .cornerRadius(16)
                .font(.custom("Caros Bold", size: 16))
                .foregroundColor(Color(hex:"#797C7B"))
            
                Button("Forgot Password?", action: {
                    willMoveToSignUpScreen = true
                })
                    .frame(maxWidth: .infinity)
                    .font(.custom("Caros Bold", size: 16))
                    .foregroundColor(Color(hex: "24786D"))
                    .padding(.top, 16)
                
            
        }.padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
            .navigate(to: SignUpScreen(), when: $willMoveToSignUpScreen)
            .navigate(to: HomeScreen(), when: $willLandOnHomeScreen)
            .overlay {
                Toast(message: toastMessage)
                    .opacity(showToast ? 1 : 0)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
        
        
    }
    
    private func showToastWithDelay() {
        showToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showToast = false
        }
    }
    
}


#Preview {
    LoginScreen()
}
