//
//  NavigationSideCell.swift
//  Mega
//
//  Created by Tope Abayomi on 19/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class NavigationSideCell: UITableViewCell {
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var selectIndicator: UIView!
    
    override func awakeFromNib() {
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        if(selected){
            selectIndicator.backgroundColor = UIColor(white: 0.0, alpha: 0.6)
        }else{
            selectIndicator.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        }
    }
}