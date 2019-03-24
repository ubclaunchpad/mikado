//
//  TripTableViewController.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit

class TripTableViewController: UITableViewController {
    
    var trips : [Trip] = []
    
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
        
        let trip = trips[indexPath.section]
        tripCell.tripName.text = trip.title
        guard let im = UIImage(named: "seattle-destination") else {
            return tripCell
        }
        tripCell.cityImage.image = im
        tripCell.coverLayer.frame = tripCell.bounds
        return tripCell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return trips.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDays", sender: self)
    }
    
    // MARK: - Populate the array of trips
    
    func setupTrips() {
        let samplePlace = Place(name: "San Francisco", coordinates: nil)
        let trip1 = Trip(title: "Trip1", startDate: Date(), endDate: Date(), destination: samplePlace, days: [])
        let trip2 = Trip(title: "Trip2", startDate: Date(), endDate: Date(), destination: samplePlace, days: [])
        trips = [trip1, trip2]
    }
    
}
