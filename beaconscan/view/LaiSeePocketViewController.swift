//
//  LaiSeePocketViewController.swift
//  beaconscan
//
//  Created by waynehui on 8/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import UIKit

class LaiSeePocketViewController: UIViewController {

    @IBOutlet weak var OpenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.addBackground("CNY-Master-Background.png")
        // Do any additional setup after loading the view.
    }

    @IBAction func OpenButtonTapped(sender: AnyObject) {
        OpenButton.removeFromSuperview()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
