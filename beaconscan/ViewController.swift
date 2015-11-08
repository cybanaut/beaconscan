//
//  ViewController.swift
//  beaconscan
//
//  Created by Kim Mo on 2015-10-31.
//  Copyright © 2015 Kim Mo. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "F94DBB23-2266-7822-3782-57BEAC0952AC")!, identifier: "Beaconstac")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addBackground("WelcomePage.png")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class ViewInfo {
    var title: String!
    var segue:  String!
    var description:  String!
    var image: String!
    
    init(title: String, segue: String){
        self.title = title
        self.segue = segue
    }
    
    init(title: String, segue: String, description: String){
        self.title = title
        self.segue = segue
        self.description = description
    }
    
    init(title: String, segue: String, description: String, image: String){
        self.title = title
        self.segue = segue
        self.description = description
        self.image = image
    }
}