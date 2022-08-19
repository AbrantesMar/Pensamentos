//
//  NotificationManager.swift
//  Pensamentos
//
//  Created by Marcio Abrantes on 19/08/22.
//

import Foundation

class NotificationManager {
    
    static var shared: NotificationManager = NotificationManager()
    
    func post(name rawValue: String) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Refresh"), object: nil)
    }
    
    func add(name rawValue: String, completion: @escaping () -> Void) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue), object: nil, queue: nil) { Notification in
            completion()
        }
    }
}
