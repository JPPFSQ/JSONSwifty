//
//  Serializer.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/19.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

public extension HandyJSON {
    public func toJSON() -> [String: Any]? {
        if let dict = Self._serializeAny(object: self) as? [String: Any] {
            return dict
        }
        
        return nil
    }
    
    public func toJSONString(prettyPrint: Bool = false) -> String? {
        if let anyObject = self.toJSON() {
            if JSONSerialization.isValidJSONObject(anyObject) {
                do {
                    let jsonData:Data
                    if prettyPrint {
                        jsonData = try JSONSerialization.data(withJSONObject: anyObject, options: [.prettyPrinted])
                    } else {
                        jsonData = try JSONSerialization.data(withJSONObject: anyObject, options: [])
                    }
                    
                    return String(data: jsonData, encoding:.utf8)
                } catch let error {
                    InternalLogger.logError(error)
                }
            } else {
                InternalLogger.logDebug("\(anyObject)) is not a valid JSON Object")
            }
        }
        
        return nil
    }
}

public extension Collection where Iterator.Element: HandyJSON {
    public func toJSON() -> [[String: Any]?] {
        return self.map{$0.toJSON()}
    }
    
    public func toJSONString(prettyPrint: Bool = false) -> String? {
        let anyArray = self.toJSON()
        if JSONSerialization.isValidJSONObject(anyArray) {
            do {
                let jsonData:Data
                if prettyPrint {
                    jsonData = try JSONSerialization.data(withJSONObject: anyArray, options: [.prettyPrinted])
                } else {
                    jsonData = try JSONSerialization.data(withJSONObject: anyArray, options: [])
                }
                
                return String(data: jsonData, encoding: .utf8)
            } catch let error {
                InternalLogger.logError(error)
            }
        } else {
            InternalLogger.logDebug("\(self.toJSON()) is not a valid JSON Object")
        }
        
        return nil
    }
}
