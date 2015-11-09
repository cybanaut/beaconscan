//
//  ProfileViewController.swift
//  beaconscan
//
//  Created by waynehui on 9/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import Foundation
import UIKit
/*
class ProfileViewController : UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var bgImageView : UIImageView!
    @IBOutlet var profileImageView : UIImageView!
    
    @IBOutlet var profileContainer : UIView!
    
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var locationLabel : UILabel!
    @IBOutlet var locationImageView : UIImageView!
    
    
    @IBOutlet var checkinsLabel : UILabel!
    @IBOutlet var friendsLabel : UILabel!
    
    @IBOutlet var photosContainer : UIView!
    @IBOutlet var photosCollectionLabel : UILabel!
    @IBOutlet var photosCollectionView : UICollectionView!
    @IBOutlet var photosLayout : UICollectionViewFlowLayout!
    
    var retailerprofile : RetailerProfile!
    var offers = [Offer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Retailer"
        
        if let cover_photo = retailerprofile.cover_photo_data {
            profileImageView.image = UIImage(data: cover_photo)
            bgImageView.image = UIImage(data: cover_photo)
        }else{
            //Utils.asyncLoadUserImage(user, imageView: profileImageView)
        }
        
        profileImageView.layer.cornerRadius = 35
        profileImageView.clipsToBounds = true
        
        nameLabel.font = UIFont(name: MegaTheme.fontName, size: 20)
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.text = retailerprofile.name
        
        locationLabel.font = UIFont(name: MegaTheme.fontName, size: 12)
        locationLabel.textColor = UIColor.whiteColor()
        locationLabel.text = retailerprofile.short_description
        
        
        let statsCountFontSize : CGFloat = 16
        let statsLabelFontSize : CGFloat = 12
        let statsCountColor = UIColor.whiteColor()
        let statsLabelColor = UIColor(white: 0.7, alpha: 1.0)
        
        addBlurView()
        
        photosCollectionLabel.font = UIFont(name: MegaTheme.boldFontName, size: 14)
        photosCollectionLabel.textColor = UIColor.blackColor()
        photosCollectionLabel.text = "Special Offers"
        
        photosContainer.backgroundColor = UIColor(white: 0.92, alpha: 1.0)
        
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        photosCollectionView.backgroundColor = UIColor.clearColor()
        
        photosLayout.itemSize = CGSizeMake(90, 90)
        photosLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        photosLayout.minimumInteritemSpacing = 5
        photosLayout.minimumLineSpacing = 10
        photosLayout.scrollDirection = .Horizontal
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return 250
        }else if indexPath.row == 1 {
            return 400
        }else if indexPath.row == 2 {
            return 100
        }else{
            return 44
        }
    }
    
    
    func addBlurView(){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRectMake(0, 0, 600, 100)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        profileContainer.insertSubview(blurView, aboveSubview: bgImageView)
        
        let topConstraint = NSLayoutConstraint(item: profileContainer, attribute: .Top, relatedBy: .Equal, toItem: blurView, attribute: .Top, multiplier: 1.0, constant: 0.0)
        
        let bottomConstraint = NSLayoutConstraint(item: profileContainer, attribute: .Bottom, relatedBy: .Equal, toItem: blurView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        
        let leftConstraint = NSLayoutConstraint(item: profileContainer, attribute: .Left, relatedBy: .Equal, toItem: blurView, attribute: .Left, multiplier: 1.0, constant: 0.0)
        
        let rightConstraint = NSLayoutConstraint(item: profileContainer, attribute: .Right, relatedBy: .Equal, toItem: blurView, attribute: .Right, multiplier: 1.0, constant: 0.0)
        
        self.profileContainer.addConstraints([topConstraint, rightConstraint, leftConstraint, bottomConstraint])
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
    }
    
    @IBAction func doneTapped(sender: AnyObject?){
        dismissViewControllerAnimated(true, completion: nil)
    }
}
*/