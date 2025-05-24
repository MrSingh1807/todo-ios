//
//  SignUpScreen.swift
//  ToDo
//
//  Created by Mayank Singh on 01/04/25.
//

import Foundation
import SwiftUI
//import SwiftKeychainWrapper



struct SignUpScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var viewModel = UserViewModel()
    
    
    @State var userName = ""
    @State var userEmail = ""
    @State var userAge = ""
    @State var userPassword = ""
    @State var confirmPassword = ""
    
    @State var toastMessage = ""
    @State var showToast = false
    
    var body: some View {
        
        ScrollView {
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
                
                Text("Save your daily tasks, ideas and personal \nstuff easily at your fingertips")
                    .font(.custom("Caros Medium", size: 14))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 16)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(hex:"#797C7B"))
                
                Text("Your Name")
                    .font(.custom("Caros Medium", size: 14))
                    .foregroundColor(Color(hex: "24786D"))
                    .padding(.top, 24)
                
                TextField("", text: $userName)
                
                
                if(userName.isEmpty) {
                    Divider()
                        .background(Color.gray)
                        .frame(height: 1)
                }
                
                Text("Your email")
                    .font(.custom("Caros Medium", size: 14))
                    .foregroundColor(Color(hex: "24786D"))
                    .padding(.top, 24)
                
                
                TextField("", text: $userEmail)
                
                if(userEmail.isEmpty) {
                    Divider()
                        .background(Color.gray)
                        .frame(height: 1)
                }
                
                Text("Your age")
                    .font(.custom("Caros Medium", size: 14))
                    .foregroundColor(Color(hex: "24786D"))
                    .padding(.top, 24)
                
                
                TextField("", text: $userEmail)
                
                if(userAge.isEmpty) {
                    Divider()
                        .background(Color.gray)
                        .frame(height: 1)
                }
                
                Text("Password")
                    .font(.custom("Caros Medium", size: 14))
                    .foregroundColor(Color(hex: "24786D"))
                    .padding(.top, 24)
                
                
                TextField("", text: $userPassword)
                
                if(userPassword.isEmpty) {
                    Divider()
                        .background(Color.gray)
                        .frame(height: 1)
                }
                
                Text("Confirm Password")
                    .font(.custom("Caros Medium", size: 14))
                    .foregroundColor(Color(hex: "24786D"))
                    .padding(.top, 24)
                
                
                TextField("", text: $confirmPassword)
                
                if(confirmPassword.isEmpty) {
                    Divider()
                        .background(Color.gray)
                        .frame(height: 1)
                }
                
                Spacer()
                
                Button("Create an account", action: {
                    checkAllFieldsAreExpected()
                    if(!showToast){
                        UserDefaults.standard.set(userName, forKey:
                                                    StorageKeys.UserName.rawValue)
                        UserDefaults.standard.set(userEmail, forKey:
                                                    StorageKeys.userEmail.rawValue)
                        UserDefaults.standard.set(userPassword, forKey: StorageKeys.userPassword.rawValue)
                        
                        UserDefaults.standard.set(userPassword, forKey: StorageKeys.age.rawValue)
                        
                        toastMessage = "Account Created Successfully"
                        showToast = true
                    }
                })
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color(hex: "F3F6F6"))
                .cornerRadius(16)
                .font(.custom("Caros Bold", size: 16))
                .foregroundColor(Color(hex:"#797C7B"))
                .padding(.top, 50)
                .padding(.bottom, 24)
                
            }.padding()
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
                .overlay {
                    Toast(message: toastMessage)
                        .opacity(showToast ? 1 : 0)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                }
        }

    }
    
    func checkAllFieldsAreExpected() {
        if userName.isEmpty {
            toastMessage = "User name is required"
            showToastWithDelay()
            return
        }
        
        if userEmail.isEmpty {
            toastMessage = "Email is required"
            showToastWithDelay()
            return
        }
        
        if userAge.isEmpty {
            toastMessage = "Age do not match"
            showToastWithDelay()
            return
        }
        
        if userPassword.isEmpty {
            toastMessage = "Password is required"
            showToastWithDelay()
            return
        }
        
        if confirmPassword.isEmpty {
            toastMessage = "Confirm password is required"
            showToastWithDelay()
            return
        }
        
        if userPassword != confirmPassword {
            toastMessage = "Passwords do not match"
            showToastWithDelay()
            return
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
    SignUpScreen()
}
