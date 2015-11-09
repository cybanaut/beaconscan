//
//  LaiSeePocketViewController.swift
//  beaconscan
//
//  Created by waynehui on 8/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import UIKit

class LaiSeePocketViewController: UIViewController {

    //@IBOutlet weak var OpenButton: UIButton!
    @IBOutlet weak var LaiSeePocketTitle: UILabel!
    @IBOutlet weak var LaiSeePocketBody: UILabel!
    
    var LaiSeePocketData : LaiSeeData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //LaiSeePocketTitle.text = LaiSeePocketData.title
        //LaiSeePocketBody.text = LaiSeePocketData.body
        //print(LaiSeePocketData)
        
        
    }
/*
    @IBAction func OpenButtonTapped(sender: AnyObject) {
        OpenButton.removeFromSuperview()
    }
  */  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
