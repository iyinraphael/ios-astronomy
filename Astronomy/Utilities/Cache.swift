//
//  Cache.swift
//  Astronomy
//
//  Created by Iyin Raphael on 10/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class Cache<Key:Hashable, Value> {
    
    func cache(value: Value, for key: Key) {
        queue.async {
            self.cacheDict[key] = value
        }
    }
    
    func value(for key:Key){
        queue.sync {
            cacheDict.removeValue(forKey: key) 
        }
    }
    
    private(set) var queue = DispatchQueue(label: "com.lambdaschool.iyinraphael")
    private(set) var cacheDict: [Key : Value] = [:]
    
    
}
