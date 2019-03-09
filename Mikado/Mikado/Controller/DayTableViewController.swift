//
//  DayTableViewController.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit
struct DayCellData{
    let image: UIImage?
    let date: String?
    
}

class DayTableViewController: UITableViewController {
    
    var dates : [Day]?
    var dayData = [DayCellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTrips()
        self.navigationItem.title = "Days"
        
        
        
        tableView.register(DayCell.self, forCellReuseIdentifier: "dayCell")
        tableView.tableFooterView = UIView()
        dayData = [DayCellData.init(image: UIImage(named: "seattle-destination")!, date: "place"), DayCellData.init(image: UIImage(named: "seattle-destination")!, date: "place"), DayCellData.init(image: UIImage(named: "seattle-destination")!, date: "place"), DayCellData.init(image: UIImage(named: "seattle-destination")!, date: "place"), DayCellData.init(image: UIImage(named: "seattle-destination")!, date: "place"),DayCellData.init(image: UIImage(named: "seattle-destination")!, date: "place")]
        tableView.rowHeight = 200
        //tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 700
        
        
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dayCell = tableView.dequeueReusableCell(withIdentifier: "dayCell") as! DayCell

        //         let day = dates?[indexPath.row]
        //        dayCell.textLabel?.text = day?.title
    
        dayCell.dayImage = dayData[indexPath.row].image
        dayCell.date = dayData[indexPath.row].date

        
        return dayCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let count = dates?.count {
//            return count
//        }
        return dayData.count
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
