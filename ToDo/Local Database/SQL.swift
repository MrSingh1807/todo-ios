//
//  SQL.swift
//  ToDo
//
//  Created by Mayank Singh on 24/05/25.
//

import Foundation
import SQLite



final class SQLiteDataBase {
    
    static let shared = SQLiteDataBase()
    
    private lazy var db: Connection = {
        let dbPath = "path/to/db.sqlite3"
        return try! Connection(dbPath)
    }()

    private lazy var users: Table = Table("users")
    
    private let id = Expression<Int64>("id")
    private let name = Expression<String?>("name")
    private let email = Expression<String>("email")
    private let age = Expression<Int64>("age")
    
    init () {
        do {
            try db.run(users.create { t in
                t.column(id, primaryKey: true)
                t.column(name)
                t.column(email, unique: true)
                t.column(age)
            })
            // CREATE TABLE "users" (
            //     "id" INTEGER PRIMARY KEY NOT NULL,
            //     "name" TEXT,
            //     "email" TEXT NOT NULL UNIQUE
            //     "age" Int
            // )
            
            
        } catch {
            print (error)
        }
    }
    
    
    func insertUser(_ user : User) {
        let insert =  users.insert(name <- "", email <- "", age <- 23)
        do {
            try db.run(insert)
        } catch {
            print (error)
        }
    }
    
    func fetchUsers() -> [User] {
        var list : [User] = []
        do {
            for user in try db.prepare(users) {
                print("id: \(user[id]), name: \(String(describing: user[name])), email: \(user[email])")
                list.append(User(name: user[name] ?? "", age: Int64(Int(user[age])), email: user[email]))
            }
            // SELECT * FROM "users"
            
        } catch {
            print(error)
        }
       return list
    }
    
    
    func updateUser(_ user : User) {
        let find = users.filter(id == user.id)
        do {
            try db.run(find.update(email <- email.replace("example.com", with: user.email)))

        } catch {
            print (error)
        }
    }
    
    func deleteUser(_ userId : Int64) {
        let find = users.filter(id == userId)
        do {
            try db.run(find.delete())

        } catch {
            print (error)
        }
    }
    
    
}


