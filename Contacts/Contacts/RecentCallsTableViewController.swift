//
//  RecentCallsTableViewController.swift
//  Contacts
//
//  Created by user on 20.03.2021.
//

import UIKit

class RecentCallsTableViewController: UITableViewController {
//    var recentCalls: [(Contact,String)] = []
    var recentCalls = [(contact: Contact, timeOfCall: String)]()

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(addContactToRecentCallList(notification:)), name: Notification.Name("addContact"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(editContactInRecentCallList(notification:)), name: Notification.Name("editContact"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deleteContactFromRecentCallList(notification:)), name: Notification.Name("deleteContact"), object: nil)
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
        cell.textLabel?.text = contact.0.firstName
        cell.detailTextLabel?.text = contact.1
        return cell
    }
    
    //MARK: - Observe Notifications
    
    @objc func addContactToRecentCallList( notification : Notification){
        guard let recentCall = notification.object as? (Contact,String) else { return }
        recentCalls.append(recentCall)
        self.tableView.reloadData()
    }
    
    @objc func editContactInRecentCallList(notification: Notification) {
        guard let recentCall = notification.object as? Contact else { return }
        //Как по-другому обновить элемент массива?
        for var (index, item) in recentCalls.enumerated() {
            if item.0.id == recentCall.id {
                item.0.firstName = recentCall.firstName
                item.0.phone = recentCall.phone
                recentCalls[index].contact = item.0
            }
        }
        self.tableView.reloadData()
    }

    @objc func deleteContactFromRecentCallList(notification: Notification) {
        guard let recentCall = notification.object as? Contact else { return }
        //Костыль
        var newRecentCalls = [(contact: Contact, timeOfCall: String)]()
        for var (index,item) in recentCalls.enumerated() {
            if item.0.id != recentCall.id {
                newRecentCalls.append(item)
            }
        }
        recentCalls = newRecentCalls
        self.tableView.reloadData()
    }
}
