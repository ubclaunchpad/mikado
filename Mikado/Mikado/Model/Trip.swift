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
     var start_date : NSDate
     var end_date : NSDate
     var destination : String
    
    init() {
        self.title = ""
        self.start_date = NSDate()
        self.end_date = NSDate()
        self.destination = ""
    }
    
    func update_start_date(dateString : String){
        self.start_date = NSDate(dateString: dateString)
    }
    
    func update_end_date(dateString : String){
        self.end_date = NSDate(dateString: dateString)
    }
    
    func update_destination(dataString : String){
        self.destination = dataString
    }
    
    func update_title(dataString : String){
        self.title = dataString
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


