//
//  HomePageViewController.swift
//  beaconscan
//
//  Created by waynehui on 8/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class HomePageViewController: UIViewController, CLLocationManagerDelegate  {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "F94DBB23-2266-7822-3782-57BEAC0952AC")!, identifier: "Beaconstac")
    let spinner = UIActivityIndicatorView( activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
    
    var laiSee = [LaiSeeData]!()
    var shopData = [RetailerProfile]()
    var api : InfuseAPI!
    var LaiSeePocketData : NSDictionary!
    //var shopData:NSDictionary!
    
    var preferredLanguages : NSLocale!
    var language = NSLocale.preferredLanguages()[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addBackground("HomePage.png")

        let switchButton = UIBarButtonItem(title: "Start", style: .Plain, target: self, action: "switchTapped")
        
        navigationItem.rightBarButtonItems=[switchButton, UIBarButtonItem(customView: spinner)]
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        // to make side menu work
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.api = InfuseAPI()
        self.laiSee = [LaiSeeData]()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func switchTapped(){
        spinner.startAnimating()
        locationManager.delegate=self;
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
            
        }
        locationManager.startRangingBeaconsInRegion(region)
        /*
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Setting")
        
        //3
        
        var pageSetting = [NSManagedObject]()
        var mode:Int!
        var gender:Int!
        var ageGroup:Int!
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            pageSetting = results as! [NSManagedObject]
            mode = pageSetting[0].valueForKey("mode") as! Int
            gender = pageSetting[0].valueForKey("gender") as! Int
            ageGroup = pageSetting[0].valueForKey("ageGroup") as! Int
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        
        let beaconParm = ["uuid":"F94DBB23-2266-7822-3782-57BEAC0952AC", "major":"1", "minor":"2"]
        print(gender)
        print(mode)
        print(ageGroup)
        //if mode == 0{
          //  getLaiSee(beaconParm)
        //} else {
            getRetailerPage(beaconParm)
        //}
*/
//let beaconParm = ["uuid":"F94DBB23-2266-7822-3782-57BEAC0952AC", "major":"1", "minor":"2"]
  //      getRetailerPage(beaconParm)
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.Unknown }
        if (knownBeacons.count > 0 && (knownBeacons[0].proximity==CLProximity.Immediate || knownBeacons[0].proximity==CLProximity.Near)) {
            locationManager.stopRangingBeaconsInRegion(region);
            
            let closestBeacon = knownBeacons[0] as CLBeacon
            // print(closestBeacon);
             print(closestBeacon.proximityUUID.UUIDString);
            // print(closestBeacon.major);
            // print(closestBeacon.minor);
            // print(closestBeacon.rssi);
            /*
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            let managedContext = appDelegate.managedObjectContext
            
            //2
            let fetchRequest = NSFetchRequest(entityName: "Setting")
            
            //3
            
            var pageSetting = [NSManagedObject]()
            var mode:Int!
            var gender:Int!
            var ageGroup:Int!
            do {
                let results = try managedContext.executeFetchRequest(fetchRequest)
                pageSetting = results as! [NSManagedObject]
                mode = pageSetting[0].valueForKey("mode") as! Int
                gender = pageSetting[0].valueForKey("gender") as! Int
                ageGroup = pageSetting[0].valueForKey("ageGroup") as! Int
            } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
            }
*/
            let defaults = NSUserDefaults.standardUserDefaults()
            var mode :Int
            if (defaults.valueForKey("mode") != nil) {
                mode = defaults.valueForKey("mode") as! Int
            } else {
                mode = 1
            }
            //let gender = defaults.valueForKey("gender") as! Int
            //let ageGroup = defaults.valueForKey("ageGroup") as! Int

            
            let beaconParm = ["uuid":closestBeacon.proximityUUID.UUIDString, "major":closestBeacon.major, "minor":closestBeacon.minor]
            
            if mode == 0{
                getLaiSee(beaconParm)
            } else {
            //    getLaiSee(beaconParm)
                getRetailerPage(beaconParm)
            }
            
            //           print(region);
            //           print(region.proximityUUID);
            //           print(region.identifier);
        }
    }
    
    func getRetailerPage(parm : NSDictionary) {
        let body: NSMutableDictionary = NSMutableDictionary()
        
        body.setValue(parm, forKey: "beacon")
        //body.setValue(language, forKey: "language")
        //body.setValue("greeting", forKey: "demo")
        
        api.getRetailerProfile(body, completion: { (return_data:[RetailerProfile]) in
            print("after completion");
            print(return_data)
            for item in return_data {
                print(item)
                self.shopData.append(item)
                //self.shopData = item as! NSDictionary
                print("before");
                print(self.shopData);
            }
            self.goRetailer()
        })
        
        
    }

    
    func getLaiSee(parm : NSDictionary) {
        let body: NSMutableDictionary = NSMutableDictionary()

        body.setValue(parm, forKey: "beacon")
        body.setValue(language, forKey: "language")
        //body.setValue("greeting", forKey: "demo")
        
        api.getLaiSee(body, completion: { (return_data:[LaiSeeData]) in
            print("after completion");
            print(return_data)
            for item in return_data {
                self.laiSee.append(item)
                print("before");
                print(self.laiSee);
            }
            self.goNextPage()
        })
        
        
    }
    func goNextPage() {
        spinner.stopAnimating();
        performSegueWithIdentifier("LaiSeeView", sender: self)

    }
    
    func goRetailer() {
        spinner.stopAnimating()
        performSegueWithIdentifier("retailerView", sender: self)
    
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "LaiSeeView"){
            if  laiSee.count>0
            {
                let passLaiSee = laiSee[0]
                let controller = segue.destinationViewController as! LaiSeePocketViewController
                controller.LaiSeePocketData = passLaiSee
            }
            
        }
        if(segue.identifier == "retailerView"){
            if  shopData.count>0
            {
                let passRetailer = shopData[0]
                let controller = segue.destinationViewController as! RetailerViewController
                controller.retailerProfile = passRetailer
            }
            
        }
        
    }


}

