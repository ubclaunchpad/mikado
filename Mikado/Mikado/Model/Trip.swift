//
//  Trip.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import Foundation

class Trip {
    
     var title : String
     var startDate : NSDate
     var endDate : NSDate
     var destination : String
    
    init() {
        self.title = ""
        self.startDate = NSDate()
        self.endDate = NSDate()
        self.destination = ""
    }
    
    func updateStartDate(dateString : String){
        self.startDate = NSDate(dateString: dateString)
    }
    
    func updateEndDate(dateString : String){
        self.endDate = NSDate(dateString: dateString)
    }
    
}

// pass in the string as the format of "dd-MMM-yyyy", will set up a new NSDate object
extension NSDate
{
    convenience
    init(dateString : String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd-MMM-yyyy"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
}


