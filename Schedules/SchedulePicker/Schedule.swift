//
//  Schedule.swift
//  Schedules
//
//  Created by Matheus on 19/02/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import Foundation
import UIKit

struct Schedule: OptionSet {
    var rawValue: Int
    
    static let monday    = Schedule(rawValue: 1 << 0)
    static let tuesday   = Schedule(rawValue: 1 << 1)
    static let wednesday = Schedule(rawValue: 1 << 2)
    static let thursday  = Schedule(rawValue: 1 << 3)
    static let friday    = Schedule(rawValue: 1 << 4)
    static let saturday  = Schedule(rawValue: 1 << 5)
    static let sunday    = Schedule(rawValue: 1 << 6)
    
    static let weekend: Schedule = [.saturday, .sunday]
    static let weekday: Schedule = [.monday, .tuesday, .wednesday, .thursday, .friday]
}
