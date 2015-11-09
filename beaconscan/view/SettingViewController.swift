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
    var ageGroupVal : Int=0
    var gender : Int=2
    var mode : Int=1
    var pageSetting = [NSManagedObject]()
    
    //let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
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
    
    
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        // print(111 ,mode)
        // print(222 ,ageGroupVal)
        // print(333 ,gender)
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Setting",inManagedObjectContext:managedContext)
        
        let setting = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
        
        //3
        
        setting.setValue(mode, forKey:"mode")
        setting.setValue(ageGroupVal, forKey:"ageGroup")
        setting.setValue(gender, forKey:"gender")
        
        //4
        do {
            try managedContext.save()
            //pageSetting.append(setting)
            //5
            //pageSetting = setting
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        showData()

        
    }
    
    func showData() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Setting")
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            pageSetting = results as! [NSManagedObject]
            print(pageSetting)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func stateChanged(switchState: UISwitch) {
        if switchState.on {
            print("Special Offer Mode")
            demoModeLabel.text = "Demo Mode: Special Offer"
            mode = 1
        } else {
            print("Lai See Mode")
            demoModeLabel.text = "Demo Mode: Lai See"
            mode = 0
        }
    }
    
    
    @IBAction func selectGender(sender: UISegmentedControl) {
        switch genderSegment.selectedSegmentIndex
        {
        case 0:
            print("Male")
            gender = 0
        case 1:
            print("Female")
            gender = 1
        case 2:
            print("Not Disclosed")
            gender = 2
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
        ageGroupVal = row
    }
    /*
    func saveData(keyName: String, insertValue:Int) {
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Setting",inManagedObjectContext:managedContext)
        
        let setting = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
        
        //3
        setting.setValue(insertValue, forKey:keyName )
        
        //4
        do {
            try managedContext.save()
            pageSetting.append(setting)
            //5
            //pageSetting = setting
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    } */
    }
