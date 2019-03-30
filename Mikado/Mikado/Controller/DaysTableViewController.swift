//
//  DayTableViewController.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit

class DaysTableViewController: UITableViewController {
    
    var trip: Trip!
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(DayCell.self, forCellReuseIdentifier: "dayCell")
        tableView.register(UINib(nibName: "TripCell", bundle: nil), forCellReuseIdentifier: "tripCell")
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let tripCell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath) as! TripCell
            tripCell.tripName.text = "Upcoming trip of \(trip.days.count) days"
            guard let im = UIImage(named: trip.imageString) else {
                return tripCell
            }
            tripCell.cityImage.image = im
            tripCell.coverLayer.frame = tripCell.bounds
            
            return tripCell
        } else {
            let dayCell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
            
            let day = trip.days[indexPath.row]
            
            dayCell.textLabel?.text = dateFormatter.string(from: day.date)
            
            return dayCell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 130 : -1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : trip.days.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDay", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DayViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                dest.day = trip.days[indexPath.row]
            }
        }
    }
}
