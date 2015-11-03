//
//  TrackCell.swift
//  Mega
//
//  Created by Tope Abayomi on 18/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class TrackCell: UITableViewCell {
    
    @IBOutlet var playImage : UIImageView!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var durationLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        playImage.image = UIImage(named: "media-play")?.imageWithRenderingMode(.AlwaysTemplate)
        playImage.tintColor = UIColor.whiteColor()
        
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        
        durationLabel.textColor = UIColor.whiteColor()
        durationLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        
        selectionStyle = .None
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        
        var image = UIImage(named: "media-play")?.imageWithRenderingMode(.AlwaysTemplate)
        if selected {
            image = UIImage(named: "media-equalizer")
        }

        playImage.image = image
        
    }
}