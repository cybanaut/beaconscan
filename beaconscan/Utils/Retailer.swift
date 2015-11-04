//
//  retailer.swift
//  beaconscan
//
//  Created by waynehui on 4/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import Foundation

class Retailer {
    
    var retail_id : Int!
    var name : String!
    var location : String!
    var telephone : String!
    var cover_photo : String!
    var thumbnail : String!
    var short_description :  String!
    var long_description : String!
    var status : String!
    
    init(data : NSDictionary){
        
        self.retail_id = data["retailer_id"] as! Int
        self.name = Utils.getStringFromJSON(data, key: "name")
        self.location = Utils.getStringFromJSON(data, key: "location")
        self.telephone = Utils.getStringFromJSON(data, key: "telephone")
        self.cover_photo = Utils.getStringFromJSON(data, key: "cover_photo")
        self.thumbnail = Utils.getStringFromJSON(data, key: "thumbnail")
        self.short_description = Utils.getStringFromJSON(data, key: "short_description")
        self.long_description = Utils.getStringFromJSON(data, key: "long_description")
        self.status = Utils.getStringFromJSON(data, key: "status")

    }
}