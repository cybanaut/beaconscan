//
//  NavigationTableCell.swift
//  Mega
//
//  Created by Tope Abayomi on 20/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class NavigationTableCell : UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var countContainer: UIView!
    
    override func awakeFromNib() {
        
        titleLabel.font = UIFont(name: MegaTheme.boldFontName, size: 16)
        titleLabel.textColor = UIColor.whiteColor()
        
        countLabel.font = UIFont(name: MegaTheme.boldFontName, size: 13)
        countLabel.textColor = UIColor.whiteColor()
        
        countContainer.backgroundColor = UIColor(red: 0.33, green: 0.62, blue: 0.94, alpha: 1.0)
        countContainer.layer.cornerRadius = 15
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        
        let countNotAvailable = countLabel.text == nil
        
        countContainer.hidden = countNotAvailable
        countLabel.hidden = countNotAvailable
        
    }
}