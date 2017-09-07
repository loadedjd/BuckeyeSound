//
//  FirebaseManager.swift
//  SoundMap3
//
//  Created by Jared Williams on 8/7/17.
//  Copyright © 2017 Jared Williams. All rights reserved.
//

import Foundation
import Firebase


class FirebaseManager {
    
    
    
    static private let databaseReference = Database.database().reference().child("iOS")
    static private var entries = [Dictionary<String, String>]()
    
  
    
    static func getCount() -> Int {
        return FirebaseManager.entries.count
    }
  
    
    static func postData(record: Record) {
        let dictionary:[String: Any] = ["Decibels": record.decibel,
                                        "time": record.timeStamp,
                                        "Location": record.location,
                                        "Lat": record.latittude,
                                        "Long": record.longitude
        ]
        databaseReference.childByAutoId().setValue(dictionary)
    }
    
    
    
    
    static func getData() {
        databaseReference.observe(.value) { (snapshot: DataSnapshot) in
            
            //  check to make sure that the database isnt empty
            if (!snapshot.hasChildren()) {
                return
            }
            
            else {
                
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadData"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadMap"), object: nil)
                
                // remove all entries because we retrieve the entire database every time
                if entries.count != 0 {
                    entries.removeAll()
                }
                
                
                let dic = snapshot.value! as! [String: Dictionary<String, String>]
                
                for object in dic {
                    entries.append(object.value)
                }
                
                print(entries)
                
                
                
            }
            
        }
        
       
    }
    
    static func getEntry(entry: Int) -> Dictionary<String, String> {
        return entries[entry]
    }
    
    static func getAllData() -> [Dictionary<String, String>] {
        return entries
    }
    
    
    
}
