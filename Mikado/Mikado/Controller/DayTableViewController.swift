//
//  DayTableViewController.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit

struct DayCellData{
    let image: UIImage
    let date: String
    
}
class DayTableViewController: UITableViewController {
    
  var dayData = [DayCellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDays()
        self.navigationItem.title = "Days"
        
        tableView.register(DayCell.self, forCellReuseIdentifier: "dayCell")
        tableView.tableFooterView = UIView()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dayCell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath) as! DayCell
        
        let day = dayData[indexPath.section]
        dayCell.setDayCell(day)
        return dayCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayData.count
       
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showEvent", sender: self)
    }
    
    // MARK: - Populate the array of trips
    
    func setupDays() {
        dayData = [DayCellData.init(image: UIImage(named: "seattle-destination")!, date: "March 15, 2019"), DayCellData.init(image: UIImage(named: "seattle-destination")!, date: "March 16, 2019"), DayCellData.init(image: UIImage(named: "seattle-destination")!, date: "March 17, 2019"), DayCellData.init(image: UIImage(named: "seattle-destination")!, date: "March 18, 2019"), DayCellData.init(image: UIImage(named: "seattle-destination")!, date: "place"),DayCellData.init(image: UIImage(named: "seattle-destination")!, date: "March 19, 2019")]
    }
}
