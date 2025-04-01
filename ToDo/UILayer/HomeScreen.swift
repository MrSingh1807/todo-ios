//
//  HomeScreen.swift
//  ToDo
//
//  Created by Mayank Singh on 01/04/25.
//

import Foundation
import SwiftUI

struct HomeScreen: View {
    
    let userName = UserDefaults.standard.string(forKey: StorageKeys.UserName.rawValue) ?? ""
    
    var body : some View {
        
        VStack{
            Text("Welcome Home \(userName)")
        }
    
    }
    
}

#Preview {
    HomeScreen()
}
