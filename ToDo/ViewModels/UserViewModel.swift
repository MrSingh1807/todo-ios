//
//  UserViewModel.swift
//  ToDo
//
//  Created by Mayank Singh on 24/05/25.
//

import Foundation



class UserViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var age: String = ""
    
    @Published var users: [User] = []

    func saveUser(_ user : User) {
        SQLiteDataBase.shared.insertUser(user)
        fetchAllUsers()
    }
    
    
    func fetchAllUsers() {
        users = SQLiteDataBase.shared.fetchUsers()
    }

    
}
