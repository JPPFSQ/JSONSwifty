//
//  ExtendCustomModelType.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/15.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

public protocol _ExtendCustomModelType: _Transformable {
    init()
    mutating func mapping(mapper: HelpingMapper)
    mutating func didFinishMapping()
}

extension _ExtendCustomModelType {
    public func mapping(mapper: HelpingMapper) {}
    public func didFinishMapping() {}
}

fileprivate func convertKeyIfNeeded(dict: [String: Any]) -> [String: Any] {
    if HandyJSONConfiguration.deserializeOptions.contains(.caseInsensitive) {
        var newDict = [String: Any]()
        dict.forEach({ (key, value) in
            newDict[key.lowercased()] = value
        })
        
        return newDict
    }
    
    return dict
}

fileprivate func getRawValueFrom(dict: [String: Any], property: PropertyInfo, mapper: HelpingMapper) -> Any? {
    if let mappingHandler = mapper.getMappingHandler(key: property.address.hashValue) {
        if let mappingPaths = mappingHandler.mappingPaths, mappingPaths.count > 0 {
            for mappingPath in mappingPaths {
                if let _value = dict.findValueBy(path: mappingPath) {
                    return _value
                }
            }
            
            return nil
        }
    }
    
    if HandyJSONConfiguration.deserializeOptions.contains(.caseInsensitive) {
        return dict[property.key.lowercased()]
    }
    
    return dict[property.key]
}

fileprivate func convertValue(rawValue: Any, property: ProcessInfo, mapper: HelpingMapper) -> Any? {
    
}
