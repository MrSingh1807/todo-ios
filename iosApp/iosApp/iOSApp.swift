import SwiftUI
import ComposeApp


@main
struct iOSApp: App {
    
    init() {
        KoinInitializerIOS().initialize_()
    }
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
    
    
}
