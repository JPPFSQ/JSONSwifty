//
//  DateFormatterTransform.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/23.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

open class DateFormatterTransform: TransformType {
    public typealias Object = Date
    public typealias JSON = String
    
    public let dateFormatter: DateFormatter
    
    public init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }
    
    open func transformFromJSON(_ value: Any?) -> Date? {
        if let dateString = value as? String {
            return dateFormatter.date(from: dateString)
        }
        
        return nil
    }
    
    open func transformToJSON(_ value: Date?) -> String? {
        if let date = value {
            return dateFormatter.string(from: date)
        }
        
        return nil
    }
}
