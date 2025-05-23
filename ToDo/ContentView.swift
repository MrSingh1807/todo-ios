//
//  ContentView.swift
//  ToDo
//
//  Created by Mayank Singh on 01/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var goHome = false

    var body: some View {
        
        VStack  {
            Text("Splash Screen")
            
            
            
            
        }.navigate(to: HomeScreen(), when: $goHome)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    goHome = true // This replaces the screen
                }
            }
        
        
    }
}

#Preview {
    ContentView()
}
