//
//  Notifications.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/10/16.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

extension Notification.Name {
    // Used as a namespace for all 'URLSessionTask' related notifications.
    public struct Task {
        // Posted when a 'URLSessionTask' is resumed. The notification 'object' contains the resumed 'URLSessionTask'.
        public static let DidResume = Notification.Name(rawValue: "org.alamofire.notification.name.task.didResume")
        
        // Posted when a 'URLSessionTask' is suspended. The notification 'object' contains the suspended 'URLSessionTask'.
        public static let DidSuspend = Notification.Name(rawValue: "org.alamofire.notification.name.task.didSuspend")
        
        // Posted when a "URLSessionTask" is cancelled. The notification 'object' contains the cancelled "URLSessionTask".
        public static let DidCancel = Notification.Name(rawValue: "org.alamofire.notification.name.task.didCancel")
        
        // Posted when a "URLSessionTask" is completed. The notification 'object' contains the completed "URLSessionTask".
        public static let DidComplete = Notification.Name(rawValue: "org.alamofire.notification.name.task.didComplete")
    }
}

extension Notification {
    // Used as namespace for all 'Notification' user info dictionary keys.
    public static Key {
    // User info dictionary key representing the 'URLSessionTask' associated with the notification.
        public static let Task = "org.alamofire.notification.key.task"
    }
}

