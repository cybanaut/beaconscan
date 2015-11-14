//
//  RetailerViewController.swift
//  beaconscan
//
//  Created by waynehui on 10/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import UIKit

class RetailerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var retailerProfile : RetailerProfile!
    var offers = [Offer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        title = retailerProfile.name
        
        Utils.asyncLoadRetailerProfileCover(retailerProfile, imageView: profileImageView)
        /*
        for offer in retailerProfile.offers {
            print(offer)
            self.offers.append(offer as! Offer)
        }
*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    func loadOffers (Offer: [Offer]){
        for retailer in getRetailer {
            self.retailers.append(retailer)
        }
        tableView.reloadData()
    }
    
    func getRetailers(){
        api.getRetailer("", language: pre, completion: didGetRetails)
        
    } */

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return viewLinks.count;
        return retailerProfile.offers.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RetailerCell") as! RetailerCell
        
        let info = retailerProfile.offers[indexPath.row] as! NSDictionary
        cell.titleLabel.text = info["title"] as? String
        cell.subtitleLabel.text = info["body"] as? String
        Utils.asyncLoadLogo((info["image"] as! String), imageView: cell.logo)
        
        /*
        let url = NSURL(string: "http://beacon.infusecreativeinc.com/int/1/tn/")
        let data = NSData(contentsOfURL: url!)
        if data != nil {
        cell.logo.image = UIImage(data:data!)
        }*/
        //Utils.asyncLoadRetailerThumbnail(info, imageView: cell.logo)
        
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //let info = viewLinks[indexPath.row]
        self .performSegueWithIdentifier("offerDetailsView", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "offerDetailsView"){
            for eachOffer in retailerProfile.offers {
                let offer = Offer(data: eachOffer as! NSDictionary)
                offers.append(offer)
            }
            
            if let row = tableView.indexPathForSelectedRow?.row {
                let controller = segue.destinationViewController as! OfferDetailsViewController
                controller.offerDetails = offers[row]
            }
        }
    }


}
