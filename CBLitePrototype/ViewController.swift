//
//  ViewController.swift
//  CBLitePrototype
//
//  Created by MatÃ­as Gil on 5/18/17.
//  Copyright © 2017 Mati­as Gil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
        let manager = CBLManager.sharedInstance()
        let database = try! manager.databaseNamed("app")
        let properties = ["title": "Couchbase Mobile", "sdk": "iOS"]
        let document = database.createDocument() // creating document for the existing database
        try! document.putProperties(properties) //adding info/properties to the database
        print("Document ID :: \(document.documentID)")
        print("Learning \(document.property(forKey: "sdk")!)")
        
        // Create replicators to push & pull changes to & from Sync Gateway
        let url = URL(string: "http://localhost:4984/hello")!
        let push = database.createPushReplication(url)
        let pull = database.createPullReplication(url)
        push.continuous = true;
        pull.continuous = true;
        
        // Start replicators
        push.start();
        pull.start();
        
        ///Users/pwc437/Library/Application Support/Couchbase/var/lib/couchbase/data
 
         */
        
        helloCBL()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func helloCBL() -> Void
    {
        let cbo = CBObjects.sharedInstance
        createDocument(database: cbo.database)
    }
    
    func createDocument(database: CBLDatabase) -> Void
    {
        let dictionary: [String: String] = ["name": "Big Party", "location": "My House"]
        let document: CBLDocument = database.createDocument()
        let docID = document.documentID
        let newRevision: CBLRevision? =  try! document.putProperties(dictionary)
        if newRevision != nil {
            print("Document created and written to database, ID = %@", docID)
        }
        updateDocument(database: database, documentID: docID)
    }
    
    func updateDocument(database: CBLDatabase, documentID: String) -> Void
    {
        let document: CBLDocument?
        document = database.document(withID: documentID)
        var docContent: [String:String] = document?.properties as! [String : String]
        docContent["description"] = "Anyone is invited!"
        docContent["address"] = "123 Elm St."
        
        let newRevision: CBLSavedRevision? = try! document?.putProperties(docContent)
        if newRevision != nil {
            print("Document created and written to database, properties = %@", document!.properties)
            
        }
        



    }



}

