//
//  SchedulePicker.swift
//  Schedules
//
//  Created by Matheus on 19/02/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import UIKit

class SchedulePicker: UIControl {

    //MARK: - Lets and Vars
    var schedule: Schedule = [] {
        didSet {
            updateView()
        }
    }
    private var weekdaysButtons: [UIButton] = []
    private var whenToActivateScheduleButtons: [UIButton] = []
    private let weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    private let whenToActivateSchedule = ["Dias de semana", "Final de semana"]
    
    //MARK: - Override Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    //MARK: - Custom Methods
    private func updateView() {
        updateButtons()
    }
    
    private func setupView() {
        setupButtons()
    }
    
    private func setupButtons() {
        for day in weekdays {
            let weekdayButton = UIButton(type: .system)
            weekdayButton.setTitle(day, for: .normal)
            
            weekdayButton.tintColor = UIColor.buttonColors.tint
            weekdayButton.setTitleColor(UIColor.buttonColors.normal, for: .normal)
            weekdayButton.setTitleColor(UIColor.buttonColors.selected, for: .selected)
            
            weekdayButton.addTarget(self, action: #selector(toggleSchedule(_:)), for: .touchUpInside)
            
            weekdaysButtons.append(weekdayButton)
        }
        
        for day in whenToActivateSchedule {
            let whenToActivateScheduleButton = UIButton(type: .system)
            whenToActivateScheduleButton.setTitle(day, for: .normal)
            
            whenToActivateScheduleButton.tintColor = UIColor.buttonColors.tint
            whenToActivateScheduleButton.setTitleColor(UIColor.buttonColors.normal, for: .normal)
            whenToActivateScheduleButton.setTitleColor(UIColor.buttonColors.selected, for: .selected)
            
            whenToActivateScheduleButton.addTarget(self, action: #selector(toggleMultiSchedule(_:)), for: .touchUpInside)
            
            whenToActivateScheduleButtons.append(whenToActivateScheduleButton)
        }
        
        let weekdaysStackView = UIStackView(arrangedSubviews: weekdaysButtons)
        let whenToActivateScheduleStackView = UIStackView(arrangedSubviews: whenToActivateScheduleButtons)
        let completeStackView = UIStackView(arrangedSubviews: [weekdaysStackView, whenToActivateScheduleStackView])
        addSubview(completeStackView)
        
        weekdaysStackView.spacing = 8.0
        weekdaysStackView.axis = .horizontal
        weekdaysStackView.alignment = .center
        weekdaysStackView.distribution = .fillEqually
        
        whenToActivateScheduleStackView.spacing = 8.0
        whenToActivateScheduleStackView.axis = .horizontal
        whenToActivateScheduleStackView.alignment = .center
        whenToActivateScheduleStackView.distribution = .fillEqually
        
        completeStackView.spacing = 8.0
        completeStackView.axis = .vertical
        completeStackView.alignment = .center
        completeStackView.distribution = .fillEqually
        
        completeStackView.translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: completeStackView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: completeStackView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: completeStackView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: completeStackView.bottomAnchor).isActive = true
        
        weekdaysStackView.translatesAutoresizingMaskIntoConstraints = false
        weekdaysStackView.topAnchor.constraint(equalTo: completeStackView.topAnchor).isActive = true
        weekdaysStackView.leadingAnchor.constraint(equalTo: completeStackView.leadingAnchor).isActive = true
        weekdaysStackView.trailingAnchor.constraint(equalTo: completeStackView.trailingAnchor).isActive = true
        
        whenToActivateScheduleStackView.translatesAutoresizingMaskIntoConstraints = false
        whenToActivateScheduleStackView.leadingAnchor.constraint(equalTo: completeStackView.leadingAnchor).isActive = true
        whenToActivateScheduleStackView.trailingAnchor.constraint(equalTo: completeStackView.trailingAnchor).isActive = true
        whenToActivateScheduleStackView.bottomAnchor.constraint(equalTo: completeStackView.bottomAnchor).isActive = true
    }
    
    private func updateButtons() {
        weekdaysButtons[0].isSelected = schedule.contains(.monday) || schedule.contains(.weekday)
        weekdaysButtons[1].isSelected = schedule.contains(.tuesday) || schedule.contains(.weekday)
        weekdaysButtons[2].isSelected = schedule.contains(.wednesday) || schedule.contains(.weekday)
        weekdaysButtons[3].isSelected = schedule.contains(.thursday) || schedule.contains(.weekday)
        weekdaysButtons[4].isSelected = schedule.contains(.friday) || schedule.contains(.weekday)
        weekdaysButtons[5].isSelected = schedule.contains(.saturday) || schedule.contains(.weekend)
        weekdaysButtons[6].isSelected = schedule.contains(.sunday) || schedule.contains(.weekend)
        
        whenToActivateScheduleButtons[0].isSelected = schedule.contains(.weekday)
        whenToActivateScheduleButtons[1].isSelected = schedule.contains(.weekend)
    }
    
    //MARK: - IBActions
    @IBAction func toggleSchedule(_ sender: UIButton) {
        guard let index = weekdaysButtons.index(of: sender) else { return }
        let element: Schedule.Element
        
        switch index {
            case 0: element = .monday
            case 1: element = .tuesday
            case 2: element = .wednesday
            case 3: element = .thursday
            case 4: element = .friday
            case 5: element = .saturday
            default: element = .sunday
        }
        
        if schedule.contains(element) {
            schedule.remove(element)
        } else {
            schedule.insert(element)
        }
        
        updateButtons()
        sendActions(for: .valueChanged)
    }
    
    @IBAction func toggleMultiSchedule(_ sender: UIButton) {
        guard let index = whenToActivateScheduleButtons.index(of: sender) else { return }
        let element: Schedule.Element

        switch index {
            case 0: element = .weekday
            default: element = .weekend
        }
        
        if schedule.contains(element) {
            schedule.remove(element)
        } else {
            schedule.insert(element)
        }
        
        updateButtons()
        sendActions(for: .valueChanged)
    }
}
