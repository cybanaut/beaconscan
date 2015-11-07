//
//  addImage.swift
//  beaconscan
//
//  Created by waynehui on 7/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import Foundation

extension UIView {
    func addBackground(filename:String) {
        // screen width and height:
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
        imageViewBackground.image = UIImage(named: filename)
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }}