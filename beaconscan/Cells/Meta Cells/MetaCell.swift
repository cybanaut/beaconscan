//
//  File.swift
//  Mega
//
//  Created by Tope Abayomi on 24/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class MetaCell: UITableViewCell {
    
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var subtitleLabel : UILabel!
    @IBOutlet weak var logo: UIImageView!
    override func awakeFromNib() {
        
        titleLabel.font = UIFont(name: MegaTheme.fontName, size: 15)
        titleLabel.textColor = UIColor.blackColor()
        
        subtitleLabel.font = UIFont(name: MegaTheme.fontName, size: 12)
        subtitleLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
    }
}
