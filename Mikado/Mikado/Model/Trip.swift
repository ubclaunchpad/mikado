//
//  Trip.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import Foundation

struct Trip {
    var title: String
    var startDate: Date
    var endDate: Date
    var destination: Place
    var imageString: String
    var days: [Day]
}
