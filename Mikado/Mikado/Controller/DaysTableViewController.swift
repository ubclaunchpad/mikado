//
//  DayTableViewController.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit

class DaysTableViewController: UITableViewController {
    
    var dates : [Day]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTrips()
        self.navigationItem.title = "Days"
        
        tableView.register(DayCell.self, forCellReuseIdentifier: "dayCell")
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dayCell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        
        let day = dates?[indexPath.row]
        
        dayCell.textLabel?.text = day?.date.description
        
        return dayCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = dates?.count {
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDay", sender: self)
    }
    
    // MARK: - Populate the array of trips
    
    func setupTrips() {
        let day1 = Day(date: Date(), events: [])
        let day2 = Day(date: Date(), events: [])
        dates = [day1, day2]
    }
}
