//
//  Business.swift
//  Eten
//
//  Created by Jackson Meyer on 1/27/18.
//  Copyright © 2018 Jackson Meyer. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

class Business {
    var businessName: String!
    var address: String!
    var profilePic: String!
    var eateryStyle: String!
    var foodServed: String!
    var businessHours: Array<String>!
    
    init(businessName: String, address: String, profilePic: String, eateryStyle: String, foodServed: String, businessHours: Array<String>) {
        self.businessName = businessName
        self.address = address
        self.profilePic = profilePic
        self.eateryStyle = eateryStyle
        self.foodServed = foodServed
        self.businessHours = businessHours
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as? NSDictionary
        self.businessName = snapshotValue!["businessName"] as! String
        self.address = snapshotValue!["address"] as! String
        self.profilePic = snapshotValue!["profilePic"] as! String
        self.eateryStyle = snapshotValue!["eateryStyle"] as! String
        self.foodServed = snapshotValue!["foodServed"] as! String
        self.businessHours = snapshotValue!["businessHours"] as! Array
    }
    
    func toAnyObject() -> [String: AnyObject] {
        return ["businessName": businessName as AnyObject, "address": address as AnyObject, "profilePic": profilePic as AnyObject, "eateryStyle": eateryStyle as AnyObject, "foodServed": foodServed as AnyObject, "businessHours": businessHours as AnyObject]
    }
}
