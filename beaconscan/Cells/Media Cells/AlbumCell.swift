//
//  AlbumCell.swift
//  Mega
//
//  Created by Tope Abayomi on 16/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit


class AlbumCell: UICollectionViewCell {
    
    @IBOutlet var coverImageView : UIImageView!
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var artistLabel : UILabel!
    @IBOutlet var songCountLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        artistLabel.textColor = UIColor.blackColor()
        artistLabel.font = UIFont(name: MegaTheme.fontName, size: 18)
        
        titleLabel.textColor = UIColor(white: 0.45, alpha: 1.0)
        titleLabel.font = UIFont(name: MegaTheme.fontName, size: 14)
        
        songCountLabel.textColor = UIColor(red: 0.33, green: 0.62, blue: 0.94, alpha: 1.0)
        songCountLabel.font = UIFont(name: MegaTheme.fontName, size: 11)
    }
}