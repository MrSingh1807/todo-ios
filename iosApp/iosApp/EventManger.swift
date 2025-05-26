//
//  EventManger.swift
//  iosApp
//
//  Created by Mayank Singh on 25/05/25.
//

import Foundation
import ComposeApp


class EventManger : ObservableObject {
    static let shared = EventManger()
    
    private let sharedPref = SharedPreference()
    
    @Published var moveToHome : Bool = false
    
    private var observer: NSObjectProtocol?
    
    
    init() {
        startObserving()
    }
    
    func startObserving() {
        stopObserving()
        observer = NotificationCenter.default.addObserver(
            forName: UserDefaults.didChangeNotification,
            object: nil,
            queue: .main
        ) { _ in
            let currentPath = self.sharedPref.getString(key: "Path", defaultValue: "")
            print("Observed path:", currentPath)
            
            if currentPath == "Onboard" {
                self.moveToHome = true
                self.sharedPref.save(key: "Path",value____: "")
            }
        }
    }
    
    func stopObserving() {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    
    
}
