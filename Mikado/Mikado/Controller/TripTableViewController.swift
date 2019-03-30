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
        
        let trip = getTrip(for: indexPath)
        tripCell.tripName.text = trip.title
        guard let im = UIImage(named: trip.imageString) else {
            return tripCell
        }
        tripCell.cityImage.image = im
        tripCell.coverLayer.frame = tripCell.bounds
        return tripCell
    }
    
    func getTrip(for indexPath: IndexPath) -> Trip {
        return trips.filter { indexPath.section == 0 ? $0.endDate >= Date() : $0.endDate < Date() }[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Current Trips" : "Past Trips"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let totalTrips = trips.count
        let pastTripsCount = trips.filter { $0.endDate < Date() }.count
        return section == 0 ? totalTrips - pastTripsCount : pastTripsCount
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDays", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DaysTableViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let trip = getTrip(for: indexPath)
                dest.title = trip.title
                dest.trip = trip
            }
        }
    }
    
    // MARK: - Populate the array of trips
    
    func setupTrips() {
        let samplePlace = Place(name: "San Francisco", coordinates: nil)
        let days = [Day(date: Date(), events: []), Day(date: Date().addingTimeInterval(86400), events: []), Day(date: Date().addingTimeInterval(172800), events: [])]
        let seattle = Trip(title: "Seattle", startDate: Date(), endDate: Date().addingTimeInterval(10000), destination: samplePlace, imageString: "seattle-destination", days: days)
        let sanfran = Trip(title: "San Francisco '19", startDate: Date(), endDate: Date().addingTimeInterval(10000), destination: samplePlace, imageString: "sf", days: days)
        let toronto = Trip(title: "Toronto", startDate: Date().addingTimeInterval(-1000), endDate: Date().addingTimeInterval(-1000), destination: samplePlace, imageString: "toronto", days: [])
        trips = [seattle, sanfran, toronto]
    }
    
}
