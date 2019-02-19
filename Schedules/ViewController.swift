//
//  ViewController.swift
//  Schedules
//
//  Created by Matheus on 19/02/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var schedulePicker: SchedulePicker!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Custom Methods
    fileprivate func setupView() {
        setupSchedulePicker()
    }

    fileprivate func setupSchedulePicker() {
        let scheduleRawValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.schedule)
        
        schedulePicker.schedule = Schedule(rawValue: scheduleRawValue)
    }
    
    //MARK: - IBActions
    @IBAction func scheduleDidChange(_ sender: SchedulePicker) {
        let userDefaults = UserDefaults.standard
        
        let scheduleRawValue = sender.schedule.rawValue
        print(sender.schedule.rawValue)
        userDefaults.set(scheduleRawValue, forKey: UserDefaults.Keys.schedule)
        userDefaults.synchronize()
    }
}

