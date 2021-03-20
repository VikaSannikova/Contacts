//
//  RecentCallsTableViewController.swift
//  Contacts
//
//  Created by user on 20.03.2021.
//

import UIKit

class RecentCallsTableViewController: UITableViewController {
    var recentCalls: [(Contact,String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived(_:)), name: Notification.Name("addContact"), object: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentCalls.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentCallCell", for: indexPath)
        let contact = recentCalls[indexPath.row]
//        let callTime = Date()
//        let calendar = Calendar.current
//        let hour = calendar.component(.hour, from: callTime)
//        let minutes = calendar.component(.minute, from: callTime)
//        let time = "\(hour):\(minutes)"
        cell.textLabel?.text = contact.0.name
        cell.detailTextLabel?.text = contact.1
        return cell
    }
    
    //MARK: - Observe Notifications
    
    @objc func notificationReceived(_ notification : Notification){
        print(123)
        guard let recentCall = notification.object as? (Contact,String) else { return }
        recentCalls.append(recentCall)
        self.tableView.reloadData()
    }

}
