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

    class func asyncLoadRetailerProfileCover(retailer: RetailerProfile, imageView : UIImageView){
        let downloadQueue = dispatch_queue_create("com.beaconscan.processsdownload", nil)
        dispatch_async(downloadQueue) {
            let data = NSData(contentsOfURL: NSURL(string: retailer.cover_photo)!)
            var image : UIImage?
            if data != nil {
                retailer.cover_photo_data = data
                image = UIImage(data: data!)!
            }
            dispatch_async(dispatch_get_main_queue()) {
                imageView.image = image
            }
        }
    }
    
    class func asyncLoadOfferImage(image: String, imageView : UIImageView){
        let downloadQueue = dispatch_queue_create("com.beaconscan.processsdownload", nil)
        dispatch_async(downloadQueue) {
            let data = NSData(contentsOfURL: NSURL(string: image)!)
            var image : UIImage?
            if data != nil {
                //offer.image_data = data
                image = UIImage(data: data!)!
            }
            dispatch_async(dispatch_get_main_queue()) {
                imageView.image = image
            }
        }
    }
    
    class func asyncLoadLogo(photo: String, imageView : UIImageView){
        
        let downloadQueue = dispatch_queue_create("com.beaconscan.processsdownload", nil)
        
        dispatch_async(downloadQueue) {
            
            let data = NSData(contentsOfURL: NSURL(string: photo)!)
            
            var image : UIImage?
            if data != nil {
                
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