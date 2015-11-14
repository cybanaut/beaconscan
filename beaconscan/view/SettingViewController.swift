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
    //@IBOutlet weak var ageGroupPicker: UIPickerView!
    @IBOutlet weak var demoModeLabel: UILabel!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var modeSegment: UISegmentedControl!
    
    @IBOutlet weak var AgeGroupTextField: UITextField!
    let ageGroup = ["","Under 20","20-29","30-39","40-49","50-59","60+"]
    var ageGroupVal : Int=0
    var gender : Int=0
    var mode : Int=0
    var pageSetting = [NSManagedObject]()
    
    //let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ageGroupPicker.dataSource = self
        //ageGroupPicker.delegate = self
        
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
        /*
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
    */
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setValue(mode, forKey: defaultsKeys.mode)
        defaults.setValue(gender, forKey: defaultsKeys.gender)
        defaults.setValue(ageGroupVal, forKey: defaultsKeys.ageGroup)
        
        defaults.synchronize()
        
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
    
    @IBAction func selectMode(sender: UISegmentedControl) {
        switch modeSegment.selectedSegmentIndex
        {
        case 0:
            print("Lai See")
            mode = 0
        case 1:
            print("Special Offer")
            mode = 1
        default:
            break;
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
    
    @IBAction func AgeGroupTextFieldTapped(sender: AnyObject) {
        let alertView = UIAlertController(title: "Select Age Group", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        /*
        pickerView = UIPickerView(frame: CGRectMake(0, 0, 250, 60))
        pickerView?.dataSource = self
        pickerView?.delegate = self
        
        alertView.view.addSubview(pickerView!)
        
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        alertView.addAction(action)
        presentViewController(alertView, animated: true, completion: nil) */
        
    }
    
    enum defaultsKeys {
        static let mode = "mode"
        static let gender = "gender"
        static let ageGroup = "ageGroup"
    }
    
    }
