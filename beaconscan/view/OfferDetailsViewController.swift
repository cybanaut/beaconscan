//
//  OfferDetailsViewController.swift
//  beaconscan
//
//  Created by waynehui on 14/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import UIKit

class OfferDetailsViewController: UIViewController {

    @IBOutlet weak var offerBody: UILabel!
    @IBOutlet weak var offerTitle: UILabel!
    @IBOutlet weak var offerImage: UIImageView!
    
    var offerDetails = Offer!()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image :String = offerDetails.image as String
        
        Utils.asyncLoadOfferImage(image, imageView: offerImage)
        
        offerTitle.font = UIFont(name: MegaTheme.fontName, size: 15)
        offerTitle.textColor = UIColor.blackColor()
        offerTitle.text = offerDetails.title
        
        offerBody.font = UIFont(name: MegaTheme.fontName, size: 13)
        offerBody.textColor = UIColor(white: 0.5, alpha: 1.0)
        offerBody.text = offerDetails.body

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
