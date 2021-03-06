//
//  ViewController.swift
//  Time Wash
//
//  Created by Lena Ngungu on 11/12/16.
//  Copyright © 2016 Lena Ngungu. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    var counter = 5
    var timer = NSTimer()
    let timeInterval:NSTimeInterval = 0.5
    let timerEnd:NSTimeInterval = 0.0
    var timeCount:NSTimeInterval = 7200.0
    let done = "Machine 1"
   
    
    var counter2 = 5
    var timer2 = NSTimer()
    let timeInterval2:NSTimeInterval = 0.5
    let timerEnd2:NSTimeInterval = 0.0
    var timeCount2:NSTimeInterval = 7200.0
    let done2 = "Machine 2"
    
    
    
    @IBOutlet weak var machine1: UIButton!
    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var resetButton1: UIButton!
  
    
   
    @IBOutlet weak var machine2: UIButton!
    @IBOutlet weak var time2: UILabel!
    @IBOutlet weak var resetButton2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupNotificationSettings()
        resetButton1.alpha = 0
        resetButton2.alpha = 0
    }
    
    func scheduleLocalNotification(word: String) {
        let myWord = word
        let localNotification = UILocalNotification()
     
        localNotification.alertBody = "\(myWord) is Done"
        localNotification.alertAction = "Ok"
        localNotification.category = "shoppingListReminderCategory"
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
          }

    
    @IBAction func machine1Action(sender: AnyObject) {
       
        machine1.enabled = false
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.timeString as (ViewController) -> () -> ()), userInfo: nil, repeats: true)
    }


    
    func timeString() {
        if counter > 0
        {
        let minutes = Int(counter) / 60 % 60
        let seconds = Int(counter) % 60
        time1.text = String(format:"%02i:%02i", minutes, seconds)
           
        //circularProgressView.animateFromAngle(circularProgressView.angle, toAngle: 0, duration: 0.5, completion: nil)
     
            counter = (counter - 1)
        }
        
            
        else
        if  counter == 0
        {
            time1.text = "Done"
            resetButton1.alpha = 1
            scheduleLocalNotification(done)
            machine1.enabled = true
            timer.invalidate()
            }
        
    }
    
    
   
    @IBAction func machine2Action(sender: AnyObject) {
        machine2.enabled = false
        timer2 = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.timeString2 as (ViewController) -> () -> ()), userInfo: nil, repeats: true)

    }
    func timeString2() {
        if (counter2 > 0)
        {
            
            let minutes2 = Int(counter2) / 60 % 60
            let seconds2 = Int(counter2) % 60
            time2.text = String(format:"%02i:%02i", minutes2, seconds2)
            counter2 = (counter2 - 1)
            
        }
        else
            if (counter2 == 0)
            {
                time2.text = "Done"
                resetButton2.alpha = 1
                scheduleLocalNotification(done2)
                machine2.enabled = true
                timer2.invalidate()
            }
    
    }
    
    @IBAction func resetAction1(sender: AnyObject) {
        resetButton1.alpha = 0
        time1.text = "OFF"
        counter = 5
       
    }
    
    @IBAction func resteAction2(sender: AnyObject) {
        resetButton2.alpha = 0
        time2.text = "OFF"
        counter2 = 5
    }
    
    func setupNotificationSettings() {
       
        let notificationSettings: UIUserNotificationSettings! = UIApplication.sharedApplication().currentUserNotificationSettings()
        
        if (notificationSettings.types == UIUserNotificationType.None){
    
            let notificationTypes: UIUserNotificationType = UIUserNotificationType.Alert
            UIUserNotificationType.Sound

            let shoppingListReminderCategory = UIMutableUserNotificationCategory()
            shoppingListReminderCategory.identifier = "shoppingListReminderCategory"

            
            
            let categoriesForSettings = NSSet(objects: shoppingListReminderCategory)
            
         
            let newNotificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: categoriesForSettings as? Set<UIUserNotificationCategory>)
            UIApplication.sharedApplication().registerUserNotificationSettings(newNotificationSettings)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}



