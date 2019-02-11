//
//  DayTableViewController.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit

class DayTableViewController: UITableViewController {
    
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
        
        dayCell.textLabel?.text = day?.title
        
        return dayCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = dates?.count {
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showEvent", sender: self)
    }
    
    // MARK: - Populate the array of trips
    
    func setupTrips() {
        let day1 = Day(title: "Day1")
        let day2 = Day(title: "Day2")
        dates = [day1, day2]
    }
}
