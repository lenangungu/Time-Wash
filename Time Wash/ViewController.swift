//
//  ViewController.swift
//  Time Wash
//
//  Created by Lena Ngungu on 11/12/16.
//  Copyright © 2016 Lena Ngungu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 1800
    var timer = NSTimer()
    let timeInterval:NSTimeInterval = 0.5
    let timerEnd:NSTimeInterval = 0.0
    var timeCount:NSTimeInterval = 7200.0
    
    var counter2 = 1800
    var timer2 = NSTimer()
    let timeInterval2:NSTimeInterval = 0.5
    let timerEnd2:NSTimeInterval = 0.0
    var timeCount2:NSTimeInterval = 7200.0
    
    @IBOutlet weak var machine1: UIButton!
    @IBOutlet weak var time1: UILabel!
  
    
   
    @IBOutlet weak var machine2: UIButton!
    @IBOutlet weak var time2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
     
            counter = (counter - 1)
        }
        else
        if ( counter == 0)
        {
            time1.text = "Done"
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
        if ( counter2 == 0)
        {
            time2.text = "Done"
        }
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

