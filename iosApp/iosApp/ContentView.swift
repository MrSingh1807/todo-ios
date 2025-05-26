import UIKit
import SwiftUI
import ComposeApp

struct ComposeView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        MainViewControllerKt.MainViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct ContentView: View {
    
    @StateObject private var eventManager = EventManger.shared
    
    @State private var onboard = false
    
    var body: some View {
        
        VStack {
            ComposeView()
                .ignoresSafeArea(.keyboard) // Compose has own keyboard handler
        }   .onChange(of: eventManager.moveToHome) { event in
            if event {
                onboard = true
                eventManager.moveToHome = false
            }
        }
        .navigate(to: OnboardScreen(), when: $onboard)
        
        
    }
}



