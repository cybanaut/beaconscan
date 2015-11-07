//
//  LaiSeeData.swift
//  beaconscan
//
//  Created by waynehui on 8/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import Foundation

class LaiSeeData {
    
    var id : Int!
    var qr_code : String!
    var type : String!
    var title : String!
    var body : String!
    var image : String!
    
    var thumbnailData : NSData?
    
    init(data : NSDictionary){
        
        self.id = data["id"] as! Int
        self.qr_code = Utils.getStringFromJSON(data, key: "qr_code")
        self.type = Utils.getStringFromJSON(data, key: "type")
        self.title = Utils.getStringFromJSON(data, key: "title")
        self.body = Utils.getStringFromJSON(data, key: "body")
    }
}