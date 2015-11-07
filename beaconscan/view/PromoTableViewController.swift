//
//  PromoTableViewController.swift
//  beaconscan
//
//  Created by waynehui on 8/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import UIKit

class PromoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
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
        
        // to make side menu work
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
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
        let cell = tableView.dequeueReusableCellWithIdentifier("RetailerCell") as! RetailerCell
        
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
        /*
        let url = NSURL(string: "http://beacon.infusecreativeinc.com/int/1/tn/")
        let data = NSData(contentsOfURL: url!)
        if data != nil {
        cell.logo.image = UIImage(data:data!)
        }*/
        Utils.asyncLoadRetailerThumbnail(info, imageView: cell.logo)
        
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //let info = viewLinks[indexPath.row]
        //self .performSegueWithIdentifier("retailerPage", sender: self)
    }
    
}
