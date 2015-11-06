//
//  SettingViewController.swift
//  beaconscan
//
//  Created by waynehui on 3/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var ageGroupPicker: UIPickerView!
    @IBOutlet weak var demoModeLabel: UILabel!
    @IBOutlet weak var selectModeSwitch: UISwitch!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    
    let ageGroup = ["","Under 20","20-29","30-39","40-49","50-59","60+"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ageGroupPicker.dataSource = self
        ageGroupPicker.delegate = self
        
        selectModeSwitch.addTarget(self, action: Selector("stateChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func stateChanged(switchState: UISwitch) {
        if switchState.on {
            print("Special Offer Mode")
            demoModeLabel.text = "Demo Mode: Special Offer"
        } else {
            print("Lai See Mode")
            demoModeLabel.text = "Demo Mode: Lai See"
        }
    }
    
    @IBAction func selectGender(sender: UISegmentedControl) {
        switch genderSegment.selectedSegmentIndex
        {
        case 0:
            print("Male")
        case 1:
            print("Female")
        case 2:
            print("Not Disclosed")
        default:
            break; 
        }
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageGroup.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ageGroup[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
}
