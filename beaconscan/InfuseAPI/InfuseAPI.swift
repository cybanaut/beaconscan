//
//  InfuseAPI.swift
//  beaconscan
//
//  Created by waynehui on 4/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import Foundation
import CoreData

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
    
    enum JSONError: String, ErrorType {
        case NoData = "ERROR: no data"
        case ConversionFailed = "ERROR: conversion from JSON failed"
    }

   // func getLaiSee(params : NSMutableDictionary, completion: ((returnData : NSDictionary) -> Void)!) {
func getLaiSee(params : NSMutableDictionary, completion: (([LaiSeeData]) -> Void)!) {
        let request = NSMutableURLRequest(URL: NSURL(string: serverUrl+"getLaiSee.php")!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: .PrettyPrinted)
            print(request)
        } catch {
            //handle error. Probably return or mark function as throws
            print(error)
            return
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        

        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            // handle error
            guard error == nil else { return }
            
            print("Response: \(response)")
            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("Body: \(strData)")
            
            let json: NSDictionary?
            do {
                json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? NSDictionary
            } catch let dataError {
                // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
                print(dataError)
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: '\(jsonStr)'")
                // return or throw?
                return
            }
            
            
            // The JSONObjectWithData constructor didn't return an error. But, we should still
            // check and make sure that json has a value using optional binding.
            var LaiSeePocket = [LaiSeeData]()
            if let parseJSON = json {
                // Okay, the parsedJSON is here, let's print all its contents
                print("return_data: \(parseJSON)")
                let return_data = LaiSeeData(data: parseJSON )
                LaiSeePocket.append(return_data)
                
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                let managedContext = appDelegate.managedObjectContext
                
                //2
                let entity =  NSEntityDescription.entityForName("LaiSee",inManagedObjectContext:managedContext)
                
                let LaiSee = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                
                //3
                LaiSee.setValue(parseJSON["id"], forKey:"id" )
                LaiSee.setValue(parseJSON["body"], forKey:"body" )
                LaiSee.setValue(parseJSON["title"], forKey:"title" )
                LaiSee.setValue(parseJSON["qr_code"], forKey:"qr_code" )
                LaiSee.setValue(parseJSON["type"], forKey:"type" )


                //4
                do {
                    try managedContext.save()
                    completion(LaiSeePocket)
                } catch let error as NSError  {
                    print("Could not save \(error), \(error.userInfo)")
                }

            }
            else {
                // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: \(jsonStr)")
            }
        })
        
        task.resume()
    }
}

func getRetailerProfile(params : NSMutableDictionary, completion: (([RetailerProfile]) -> Void)!) {
    let request = NSMutableURLRequest(URL: NSURL(string: "http://beacon.infusecreativeinc.com/beacon/getRetailerPage.php")!)
    let session = NSURLSession.sharedSession()
    request.HTTPMethod = "POST"
    
    do {
        request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: .PrettyPrinted)
        print(request)
    } catch {
        //handle error. Probably return or mark function as throws
        print(error)
        return
    }
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    
    let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
        // handle error
        guard error == nil else { return }
        
        print("Response: \(response)")
        let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
        print("Body: \(strData)")
        
        let json: NSDictionary?
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? NSDictionary
        } catch let dataError {
            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
            print(dataError)
            let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("Error could not parse JSON: '\(jsonStr)'")
            // return or throw?
            return
        }
        
        
        // The JSONObjectWithData constructor didn't return an error. But, we should still
        // check and make sure that json has a value using optional binding.
        var retailerProfle = [RetailerProfile]()
        if let parseJSON = json {
            // Okay, the parsedJSON is here, let's print all its contents
            print("return_data: \(parseJSON)")
            let return_data = RetailerProfile(data: parseJSON )
            retailerProfle.append(return_data)
            completion(retailerProfle)
        }
        else {
            // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
            let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("Error could not parse JSON: \(jsonStr)")
        }
    })
    
    task.resume()

}
