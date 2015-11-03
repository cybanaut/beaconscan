//
//  ProductImageCell.swift
//  Mega
//
//  Created by Tope Abayomi on 14/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class ProductImageCell: UICollectionViewCell {
    
    @IBOutlet var productImageView : UIImageView!
    
    override func awakeFromNib() {
        
        productImageView.layer.cornerRadius = 5
    }
}