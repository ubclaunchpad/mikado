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
        
        tableView.register(TripCell.self, forCellReuseIdentifier: "tripCell")
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tripCell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath)
        
        let trip = trips?[indexPath.row]

        tripCell.textLabel?.text = trip?.title
        
        return tripCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = trips?.count {
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDay", sender: self)
    }
    
    // MARK: - Populate the array of trips
    
    func setupTrips() {
        let samplePlace = Place(name: "San Francisco", coordinates: nil)
        let trip1 = Trip(title: "Trip1", startDate: Date(), endDate: Date(), destination: samplePlace, days: [])
        let trip2 = Trip(title: "Trip2", startDate: Date(), endDate: Date(), destination: samplePlace, days: [])
        trips = [trip1, trip2]
    }
    
}
