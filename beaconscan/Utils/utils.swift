//
//  utils.swift
//  beaconscan
//
//  Created by waynehui on 4/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import Foundation
import UIKit


class Utils {

    class func asyncLoadRetailerThumbnail(retailer: Retailer, imageView : UIImageView){
        
        let downloadQueue = dispatch_queue_create("com.beaconscan.processsdownload", nil)
        
        dispatch_async(downloadQueue) {
            
            let data = NSData(contentsOfURL: NSURL(string: retailer.thumbnail)!)
            
            var image : UIImage?
            if data != nil {
                retailer.thumbnailData = data
                image = UIImage(data: data!)!
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                imageView.image = image
            }
        }
    }

    
    class func getStringFromJSON(data: NSDictionary, key: String) -> String{
        
        //let info : AnyObject? = data[key]
        
        if let info = data[key] as? String {
            return info
        }
        return ""
    }
    
}