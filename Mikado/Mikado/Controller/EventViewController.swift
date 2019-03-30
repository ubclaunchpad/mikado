//
//  EventViewController.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit
import Foundation

class EventViewController: PullUpController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var visualEffectView: UIVisualEffectView!
    @IBOutlet private weak var searchBoxContainerView: UIView!
    @IBOutlet private weak var searchSeparatorView: UIView! {
        didSet {
            searchSeparatorView.layer.cornerRadius = searchSeparatorView.frame.height/2
        }
    }
    @IBOutlet private weak var firstPreviewView: UIView!
    @IBOutlet private weak var secondPreviewView: UIView!
    @IBOutlet private weak var tableView: UITableView!
    
    unowned var delegate: EventViewControllerDelegate?
    
    private var events = [Event]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.attach(to: self)
        setupDataSource()
        
        tableView.register(EventCell.self, forCellReuseIdentifier: "eventCell")
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.layer.cornerRadius = 12
    }
    
    private func setupDataSource() {
        let dataSource = TripAdvisorDataSource()
        let place = Place(name: "San Francisco", coordinates: nil)
        let attractions = dataSource.attractionGroup(for: place.name).flatMap { $0.attractions }
        events = attractions.map { Event(title: $0.title, location: place, rating: 4.0, description: "", imageURL: nil, suggestedDuration: 1.0...2.0) }
    }
    
    // MARK: - PullUpController
    
    override var pullUpControllerPreferredSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: secondPreviewView.frame.maxY)
    }
    
    var pullUpControllerPreviewOffset: CGFloat {
        return searchBoxContainerView.frame.height
    }
    
    override var pullUpControllerMiddleStickyPoints: [CGFloat] {
        return [firstPreviewView.frame.maxY]
    }
    
    var pullUpControllerIsBouncingEnabled: Bool {
        return false
    }
}

// MARK: - UISearchBarDelegate

extension EventViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if let lastStickyPoint = pullUpControllerAllStickyPoints.last {
            pullUpControllerMoveToVisiblePoint(lastStickyPoint, animated: true, completion: nil)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}

extension EventViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventCell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        
        let event = events[indexPath.row]
        
        eventCell.textLabel?.text = event.title
        
        return eventCell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        view.endEditing(true)
        pullUpControllerMoveToVisiblePoint(pullUpControllerMiddleStickyPoints[0], animated: true, completion: nil)
        delegate?.didSelect(event: events[indexPath.row])
    }
}

protocol EventViewControllerDelegate: class {
    func didSelect(event: Event)
}
