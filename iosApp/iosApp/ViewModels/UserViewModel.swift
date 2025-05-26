//
//  UserViewModel.swift
//  ToDo
//
//  Created by Mayank Singh on 24/05/25.
//

import Foundation
import ComposeApp

class UserViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var age: String = ""
 
    
//    private var shr :  SharedModule
//    private var sqlRepo : TodoRepository
    
    init() {
//        shr = SharedModule()
//        sqlRepo = shr.getTodoRepository()

    }

    
//    func insert() async {
//        do {
//            try await sqlRepo.insert(item: TodoEntity(id:12, title: "as", content: "asdas"))
//        } catch { }
//       
//    }
    
}
