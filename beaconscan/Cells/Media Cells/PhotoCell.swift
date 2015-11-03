//
//  PhotoCell.swift
//  Mega
//
//  Created by Tope Abayomi on 16/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit


class PhotoCell: UICollectionViewCell {
    
    @IBOutlet var coverImageView : UIImageView!
    @IBOutlet var iconImageView : UIImageView!
    @IBOutlet var countLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.image = UIImage(named: "icon-camera")
        
        countLabel.textColor = UIColor.whiteColor()
        countLabel.font = UIFont(name: MegaTheme.fontName, size: 11)
    }
}