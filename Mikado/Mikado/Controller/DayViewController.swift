//
//  EventViewController.swift
//  Mikado
//
//  Created by Aziz Zaynutdinov on 2/10/19.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit

class DayViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var day: Day!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSource()
        addPullUpController()
        
        tableView.register(EventCell.self, forCellReuseIdentifier: "eventCell")
    }
    
    private func addPullUpController() {
        guard let pullUpController = UIStoryboard(name: "EventsViewController", bundle: nil).instantiateViewController(withIdentifier: "EventViewController") as? EventViewController else {
            return
        }
        pullUpController.delegate = self
        
        addPullUpController(pullUpController, initialStickyPointOffset: 80, animated: true)
    }
    
    private func setupDataSource() {
        self.tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DayViewController: UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventCell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        
        eventCell.textLabel?.text = day.events[indexPath.row].event.title
        
        return eventCell
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return day.events.count
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "showEvent", sender: self)
    }
}

extension DayViewController: EventViewControllerDelegate {
    func didSelect(event: Event) {
        day.events.append(ScheduledEvent(event: event, beginTime: Date(), endTime: Date()))
        tableView.insertRows(at: [IndexPath(row: day.events.count - 1, section: 0)], with: .automatic)
    }
}
