//
//  SettingViewController.swift
//  beaconscan
//
//  Created by waynehui on 3/11/15.
//  Copyright © 2015年 Kim Mo. All rights reserved.
//

import UIKit
import CoreData

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var ageGroupPicker: UIPickerView!
    @IBOutlet weak var demoModeLabel: UILabel!
    @IBOutlet weak var selectModeSwitch: UISwitch!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    
    let ageGroup = ["","Under 20","20-29","30-39","40-49","50-59","60+"]
    //var pageSetting = [NSManagedObject]()
    
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
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Setting", inManagedObjectContext: managedContext)
        let mySetting = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        mySetting.setValue(1, forKey:"mode")
        mySetting.setValue(1, forKey:"gender")

        
        //saveData("more", value: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func stateChanged(switchState: UISwitch) {
        if switchState.on {
            print("Special Offer Mode")
            demoModeLabel.text = "Demo Mode: Special Offer"
            //saveData("mode", value: 0)
        } else {
            print("Lai See Mode")
            demoModeLabel.text = "Demo Mode: Lai See"
            //saveData("mode", value: 1)
        }
    }
    
    @IBAction func selectGender(sender: UISegmentedControl) {
        switch genderSegment.selectedSegmentIndex
        {
        case 0:
            print("Male")
            //saveData("gender", value: 0)
        case 1:
            print("Female")
            //saveData("gender", value: 1)
        case 2:
            print("Not Disclosed")
            //saveData("gender", value: 2)
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
        saveData("ageGroup", value: row)
    }
    
    func saveData(key: String, value:Int) {
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Setting",inManagedObjectContext:managedContext)
        
        let setting = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
        
        //3
        setting.setValue(value, forKey: key)
        
        
        //4
        do {
            try managedContext.save()
            //pageSetting.insert(setting, atIndex: 1)
            //5
            //pageSetting = setting
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
}
