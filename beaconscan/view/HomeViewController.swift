//
//  HomeViewController.swift
//  beaconscan
//
//  Created by waynehui on 8/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "F94DBB23-2266-7822-3782-57BEAC0952AC")!, identifier: "Beaconstac")

    override func viewDidLoad() {
        super.viewDidLoad()
        let rightItem = UIActivityIndicatorView( activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
        rightItem.startAnimating()
        navigationItem.rightBarButtonItems?.append(UIBarButtonItem(customView: rightItem))
        navigationItem.rightBarButtonItems?.append(UIBarButtonItem(title: "Start", style: .Plain, target: self, action: "beaconSwitchTapped"))
        
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        
        // to make side menu work
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
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
    
    func beaconSwitchTapped() {
        //locationManager.startRangingBeaconsInRegion(region)
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.Unknown }
        if (knownBeacons.count > 0) {
            let closestBeacon = knownBeacons[0] as CLBeacon
            //            self.view.backgroundColor = self.colours[closestBeacon.minor.integerValue]
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
