//
//  OfferCell.swift
//  beaconscan
//
//  Created by waynehui on 9/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//


import Foundation
import UIKit

class OfferCell : UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var body: UILabel!
    @IBOutlet var blurView : UIView!
    
    var blurViewFrame : CGRect!
    
    override func awakeFromNib() {
        
        titleLabel.font = UIFont(name: MegaTheme.fontName, size: 14)
        titleLabel.textColor = UIColor.blackColor()
        
        body.font = UIFont(name: MegaTheme.fontName, size: 10)
        body.textColor = UIColor(white: 0.4, alpha: 1.0)
        
        layer.borderColor = UIColor(white: 0.9, alpha: 1.0).CGColor
        layer.borderWidth = 0.3
    }
    
    func setCellSelected(selected : Bool){
        
        if selected {
            
            blurViewFrame = blurView.frame
            var frame = self.frame
            frame.origin = CGPointMake(0, 0)
            
            //            var height = frame.size.height
            
            UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2.0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                
                self.blurView.frame = frame
                
                }, completion: { (finished: Bool) in
                    
            })
        }else{
            
            UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2.0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                
                self.blurView.frame = self.blurViewFrame
                
                }, completion: { (finished: Bool) in
                    
            })
        }
    }
}
