//
//  Offer.swift
//  beaconscan
//
//  Created by waynehui on 9/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import Foundation

class Offer {
    
    var title : String!
    var body : String!
    var photoID : String!
    var image : String!
    var image_data : NSData?

    
    init(data : NSDictionary){
        
        self.title = Utils.getStringFromJSON(data, key: "title")
        self.body = Utils.getStringFromJSON(data, key: "body")
        self.photoID = Utils.getStringFromJSON(data, key: "photo_id")
        self.image = Utils.getStringFromJSON(data, key: "image")
    }
}