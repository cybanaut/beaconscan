//
//  ViewController.swift
//  beaconscan
//
//  Created by Kim Mo on 2015-10-31.
//  Copyright © 2015 Kim Mo. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "F94DBB23-2266-7822-3782-57BEAC0952AC")!, identifier: "Beaconstac")
    let colours = [
        2: UIColor(red: 84/255, green: 77/255, blue: 160/255, alpha: 1),
        49375: UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate=self;
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
  
        }
        locationManager.startRangingBeaconsInRegion(region)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.Unknown }
        if (knownBeacons.count > 0) {
            let closestBeacon = knownBeacons[0] as CLBeacon
            self.view.backgroundColor = self.colours[closestBeacon.minor.integerValue]
//            print(closestBeacon);
            print(closestBeacon.proximityUUID.UUIDString);
            print(closestBeacon.major);
            print(closestBeacon.minor);
            print(closestBeacon.rssi);
 //           print(region);
 //           print(region.proximityUUID);
 //           print(region.identifier);
        }
    }
}

