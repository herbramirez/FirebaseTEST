//
//  DataManger.swift
//  OSL
//
//  Created by ramirez herbert on 3/11/18.
//  Copyright © 2018 ramirez herbert. All rights reserved.
//

import Foundation
import FirebaseStorage
import Firebase

class DataManager {
    
    let shared = DataManager()
    
    let storageRef = Storage.storage().reference()
    let databaseRef = Database.database().reference()
    
    func get3DFiles() -> [String] {
        
        databaseRef.child("files").observeSingleEvent(of: .value) { (snapshot) in
            
            let dict = snapshot.value as! [String : String]
            for file in dict {
                
                let filePath = file.value
                self.storageRef.child("\(filePath)/texture.png").downloadURL(completion: { (url, error) in
                    if (error != nil) {
                        url
                    }
                })
                
                self.storageRef.child("\(filePath)/scene.").downloadURL(completion: { (url, error) in
                    if (error != nil) {
                        url
                    }
                })
                
            }
            
        }
        
    }
    
}
