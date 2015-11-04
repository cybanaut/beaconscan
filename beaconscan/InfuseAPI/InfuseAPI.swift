//
//  InfuseAPI.swift
//  beaconscan
//
//  Created by waynehui on 4/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import Foundation

class InfuseAPI {
    
    let serverUrl = "http://beacon.infusecreativeinc.com/beacon/"
    
    func getRetailer(UUID: String, language: String, completion: (([Retailer]) -> Void)!) {
        
        var langParm = ""
        var uuidParm = ""
        
        if language != "" {
            langParm = "language="+language+"&"
        }
        
        if UUID != "" {
            uuidParm = "beacon="+UUID+"&"
        }
        
        let urlString = serverUrl + "getRetailers.php?"+langParm+uuidParm
        
        let session = NSURLSession.sharedSession()
        let shotsUrl = NSURL(string: urlString)
        
        let task = session.dataTaskWithURL(shotsUrl!){
            (data, response, error) -> Void in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                
                var  retailers = [Retailer]()
                do {
                    let returnData = try NSJSONSerialization.JSONObjectWithData(data! , options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    let returnRetails = returnData["retailers"] as? NSArray
                    
                    for retailer in returnRetails!{
                        let retailer = Retailer(data: retailer as! NSDictionary)
                        retailers.append(retailer)
                    }
                    
                }catch{
                    
                }
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(retailers)
                    }
                }
                
            }
        }
        
        task.resume()
    }

    

}
