//
//  userModel.swift
//  Eten
//
//  Created by Jackson Meyer on 1/27/18.
//  Copyright © 2018 Jackson Meyer. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

class User {
    var name: String!
    var profilePic: String!
    var reviews: Array<String>!
    
    init(name: String, profilePic: String, reviews: Array<String>) {
        self.name = name
        self.profilePic = profilePic
        self.reviews = reviews
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as? NSDictionary
        
        self.name = snapshotValue!["name"] as! String
        self.profilePic = snapshotValue!["profilePic"] as! String
        self.reviews = snapshotValue!["reviews"] as! Array
    }
    
    func toAnyObject() -> [String: AnyObject] {
        return ["name": name as AnyObject, "profilePic": profilePic as AnyObject, "reviews": reviews as AnyObject]
    }
}
