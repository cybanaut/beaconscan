//
//  RetailerCell.swift
//  beaconscan
//
//  Created by waynehui on 5/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import Foundation
import UIKit

class RetailerCell: UITableViewCell {
    
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

