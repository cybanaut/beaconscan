//
//  HomePageViewController.swift
//  beaconscan
//
//  Created by waynehui on 8/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import UIKit
import CoreLocation

class HomePageViewController: UIViewController, CLLocationManagerDelegate  {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "F94DBB23-2266-7822-3782-57BEAC0952AC")!, identifier: "Beaconstac")
    let spinner = UIActivityIndicatorView( activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
    
    var api : InfuseAPI!
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

    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.Unknown }
        if (knownBeacons.count > 0 && (knownBeacons[0].proximity==CLProximity.Immediate || knownBeacons[0].proximity==CLProximity.Near)) {
            locationManager.stopRangingBeaconsInRegion(region);
            spinner.stopAnimating();
            let closestBeacon = knownBeacons[0] as CLBeacon
             print(closestBeacon);
            // print(closestBeacon.proximityUUID.UUIDString);
            // print(closestBeacon.major);
            // print(closestBeacon.minor);
            // print(closestBeacon.rssi);
            let beaconParm = ["uuid":closestBeacon.proximityUUID.UUIDString, "major":closestBeacon.major, "minor":closestBeacon.minor]
            let body: NSMutableDictionary = NSMutableDictionary()
            
            body.setValue(beaconParm, forKey: "beacon")
            body.setValue(language, forKey: "language")

            api.getLaiSee(body)
            
            performSegueWithIdentifier("LaiSeeView", sender: self)
            
            //           print(region);
            //           print(region.proximityUUID);
            //           print(region.identifier);
        }
    }
    
    
    @IBAction func getLaiSee(sender: AnyObject) {
        let beaconParm = ["uuid":"F94DBB23-2266-7822-3782-57BEAC0952AC", "major":"1", "minor":"2"]
        let body: NSMutableDictionary = NSMutableDictionary()

        body.setValue(beaconParm, forKey: "beacon")
        body.setValue(language, forKey: "language")
        body.setValue("greeting", forKey: "demo")

        api.getLaiSee(body)
        
        performSegueWithIdentifier("LaiSeeView", sender: self)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
