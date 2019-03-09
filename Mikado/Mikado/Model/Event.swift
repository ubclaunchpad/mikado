//
//  Event.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import Foundation

struct Event {
    var title: String
    var location: Place
    var rating: Double
    var description: String
    var imageURL: URL
    var suggestedDuration: Range<Double>
}
