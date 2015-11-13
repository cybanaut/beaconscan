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
    
    var shopData:[RetailerProfile] = []
    
    var preferredLanguages : NSLocale!
    var pre = NSLocale.preferredLanguages()[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
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
        api.getRetailer("", language: pre, completion: didGetRetails)
        
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
        
        
        let info = retailers[indexPath.row]
        getRetailerPage(info.retailer_id)
    }
    
    func getRetailerPage(parm : Int) {
        let body: NSMutableDictionary = NSMutableDictionary()
        
        body.setValue(parm, forKey: "retailer_id")
        //body.setValue(language, forKey: "language")
        //body.setValue("greeting", forKey: "demo")
        
        api.getRetailerProfile(body, completion: { (return_data:[RetailerProfile]) in
            print("after completion");
            //print(return_data)
            for item in return_data {
                print(item)
                if self.shopData.count>0 {
                    self.shopData[0] = item
                } else {
                    self.shopData.append(item)
                }
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    self .performSegueWithIdentifier("retailerPageView", sender: self)
                }
            }
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "retailerPageView"){
            if  shopData.count>0
            {
                let passRetailer = shopData[0]
                let controller = segue.destinationViewController as! RetailerViewController
                controller.retailerProfile = passRetailer
            }
            
        }
        
    }


    
}
