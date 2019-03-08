//
//  TripTableViewController.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit

class TripTableViewController: UITableViewController {
    
    var trips : [Trip]?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTrips()
        self.navigationItem.title = "Trips"
        
        tableView.register(UINib(nibName: "TripCell", bundle: nil), forCellReuseIdentifier: "tripCell")
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tripCell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath) as! TripCell
        
        let trip = trips?[indexPath.section]
        tripCell.setImage(UIImage(named: "seattle-destination")!)
        tripCell.setLabel((trip?.title)!)
        return tripCell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let count = trips?.count {
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDay", sender: self)
    }
    
    // MARK: - Populate the array of trips
    
    func setupTrips() {
        let trip1 = Trip()
        trip1.title = "TRIP1"
        let trip2 = Trip()
        trip2.title = "TRIP2"
        trips = [trip1, trip2]
    }
    
}
