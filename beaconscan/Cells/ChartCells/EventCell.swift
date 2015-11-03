//
//  EventCell.swift
//  Mega
//
//  Created by Tope Abayomi on 08/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class EventCell: UITableViewCell {
    
    @IBOutlet var typeImageView : UIImageView!
    
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var timeLabel : UILabel!
    @IBOutlet var descriptionLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont(name: MegaTheme.semiBoldFontName, size: 18)
        titleLabel.textColor = UIColor.blackColor()
        
        timeLabel.font = UIFont(name: MegaTheme.semiBoldFontName, size: 16)
        timeLabel.textColor = UIColor(red: 0.39, green: 0.26, blue: 0.82, alpha: 1.0)
        
        descriptionLabel.font = UIFont(name: MegaTheme.fontName, size: 12)
        descriptionLabel.textColor = UIColor(white: 0.70, alpha: 1.0)
        
    }
}