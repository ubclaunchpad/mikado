//
//  Day.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import Foundation

struct Day {
    var date: Date
    var events: [ScheduledEvent]
}

struct ScheduledEvent {
    var event: Event
    var beginTime: Date
    var endTime: Date
}
