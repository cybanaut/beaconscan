//
//  RetailerProfile.swift
//  beaconscan
//
//  Created by waynehui on 9/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import Foundation

class RetailerProfile {
    
    var retailer_id : Int!
    var name : String!
    var cover_photo : String!
    var thumbnail : String!
    var short_description :  String!
    var long_description : String!
    var offer : Offer!
    
    var thumbnailData : NSData?
    
    init(data : NSDictionary){
        
        self.retailer_id = data["retailer_id"] as! Int
        self.name = Utils.getStringFromJSON(data, key: "name")
        self.cover_photo = Utils.getStringFromJSON(data, key: "cover_photo")
        self.thumbnail = Utils.getStringFromJSON(data, key: "thumbnail")
        self.short_description = Utils.getStringFromJSON(data, key: "short_description")
        self.long_description = Utils.getStringFromJSON(data, key: "long_description")
        let offers = data["offers"] as! NSDictionary
        self.offer = Offer(data: offers)
        
    }
}