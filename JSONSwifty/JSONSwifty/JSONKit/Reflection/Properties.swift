//
//  Properties.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/22.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

struct Property {
    let key: String
    let value: Any
    
    // An instance property description
    struct Description {
        public let key: String
        public let type: Any.Type
        public let offset: Int
        public func write(_ value: Any, to storage: UnsafeMutableRawPointer) {
            return extensions(of: type).write(value,to:storage.advanced(by: offset))
        }
    }
}

// Retrieve properties for 'instance'
func getProperties(forInstance instance: Any) -> [Property]? {
    if let props = getProperties(forType: type(of: instance)) {
        var copy = extensions(of: instance)
        let storage = copy.storage()
        return props.map {
            nextProperty(description: $0, storage: storage)
        }
    }
    
    return nil
}

private func nextProperty(description: Property.Description, storage: UnsafeRawPointer) -> Property {
    return Property(
        key: description.key,
        value: extensions(of: description.type).value(from: storage.advanced(by: description.offset))
    )
}

// Retrieve properties for 'type'
func getProperties(forType type: Any.Type) -> [Property.Description]? {
    if let nominalType = Metadata.Struct(type: type) {
        return fetchProperties(nominalType: nominalType)
    } else if let nominalType = Metadata.Class(type: type) {
        return nominalType.properties()
    } else if let nominalType = Metadata.ObjcClassWrapper(type: type), let targetType = nominalType.targetType {
        return getProperties(forType: targetType)
    } else {
        return nil
    }
}

func fetchProperties<T : NominalType>(nominalType: T) -> [Property.Description]? {
    return propertiesForNominalType(nominalType)
}

private func propertiesForNominalType<T : NominalType>(_ type: T) -> [Property.Description]? {
    guard let nominalTypeDescriptor = type.nominalTypeDescriptor else {
        return nil
    }
    
    guard nominalTypeDescriptor.numberOfFields != 0 else {
        return []
    }
    
    guard let fieldTypes = type.fieldTypes, let fieldOffsets = type.fieldOffsets else {
        return nil
    }
    
    let fieldNames = nominalTypeDescriptor.fieldNames
    return (0..<nominalTypeDescriptor.numberOfFields).map{ i in
        return Property.Description(key: fieldNames[i], type: fieldTypes[i], offset: fieldOffsets[i])
    }
}
