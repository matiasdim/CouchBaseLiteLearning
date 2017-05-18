//
//  CBObjects.swift
//  CBLitePrototype
//
//  Created by MatÃ­as Gil on 5/18/17.
//  Copyright © 2017 Mati­as Gil. All rights reserved.
//

import UIKit


class CBObjects: NSObject {
    static let sharedInstance = CBObjects()
    
    var database: CBLDatabase
    var manager: CBLManager
    
    static let shared: CBObjects = CBObjects()
    
    override init() {
        self.manager = CBLManager.sharedInstance()
        self.database = try! self.manager.databaseNamed("couchbaseevents")
    }
    
}
