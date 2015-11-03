//
//  CategoryCell.swift
//  Mega
//
//  Created by Tope Abayomi on 10/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class CategoryCell : UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var alphaView : UIView!
    
    var blurViewFrame : CGRect!
    
    override func awakeFromNib() {
        
        titleLabel.font = UIFont(name: MegaTheme.boldFontName, size: 13)
        titleLabel.textColor = UIColor.whiteColor()
        
        countLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        countLabel.textColor = UIColor(white: 0.85, alpha: 1.0)
        
        alphaView.backgroundColor = UIColor(white: 0.2, alpha: 0.5)
    }
}