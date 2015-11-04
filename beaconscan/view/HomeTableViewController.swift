//
//  HomeTableViewController.swift
//  beaconscan
//
//  Created by waynehui on 3/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import UIKit
import CoreLocation

class HomeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet var tableView : UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "F94DBB23-2266-7822-3782-57BEAC0952AC")!, identifier: "Beaconstac")
    let colours = [
        2: UIColor(red: 84/255, green: 77/255, blue: 160/255, alpha: 1),
        49375: UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
    ]
    
    var retailers : [Retailer]!
    var api : InfuseAPI!
    
    //var viewLinks : [ViewInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        /*
        viewLinks = [ViewInfo]()
        viewLinks.append(ViewInfo(title: "Shop 1", segue: "shop" ,description: "Get sports equipment here", image: ""))
        viewLinks.append(ViewInfo(title: "Shop 2", segue: "category", description: "Christmas toys on sale now", image: ""))
        viewLinks.append(ViewInfo(title: "Shop 3", segue: "cart", description: "Biggest Bookstore in town", image: ""))
        */
        self.retailers = [Retailer]()
        self.api = InfuseAPI()
        
        getRetailers()
        
        let rightItem = UIActivityIndicatorView( activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
        rightItem.startAnimating()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightItem)
        
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        
        // to make side menu work
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //to make beacon scanning work
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
    
    
    func didGetRetails(getRetailer: [Retailer]){
        
        for retailer in getRetailer {
            self.retailers.append(retailer)
        }
        tableView.reloadData()
    }
    
    func getRetailers(){
        api.getRetailer("", language: "", completion: didGetRetails)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return viewLinks.count;
        return retailers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MetaCell") as! MetaCell
        
        /*let info = viewLinks[indexPath.row]
        cell.titleLabel.text = info.title
        cell.subtitleLabel.text = info.description
        let url = NSURL(string: info.image!)
        let data = NSData(contentsOfURL: url!)
        if data != nil {
            cell.logo.image = UIImage(data:data!)
        }*/
        
        let info = retailers[indexPath.row]
        cell.titleLabel.text = info.name
        cell.subtitleLabel.text = info.short_description
        let url = NSURL(string: info.cover_photo!)
        let data = NSData(contentsOfURL: url!)
        if data != nil {
            cell.logo.image = UIImage(data:data!)
        }
        
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //let info = viewLinks[indexPath.row]
        //self .performSegueWithIdentifier("retailerPage", sender: self)
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
