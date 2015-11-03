//
//  ConnectionCell.swift
//  Mega
//
//  Created by Tope Abayomi on 16/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class ConnectionCell : UITableViewCell {
    
    @IBOutlet var iconImageView : UIImageView!
    
    @IBOutlet var titleLabel : UILabel!
    
    @IBOutlet var switchView : UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont(name: MegaTheme.fontName, size: 15)
        titleLabel.textColor = UIColor.blackColor()
    }
}
