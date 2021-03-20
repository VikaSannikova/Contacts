//
//  ContactsViewController.swift
//  Contacts
//
//  Created by user on 18.03.2021.
//

import UIKit

class ContactsViewController: UITableViewController {
    var contacts : [Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let vika = Contact(name: "Vika Sannikova", number: "88003553535")
        contacts.append(vika)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.number
        return cell
    }
    
    // MARK: - Navigation
    
    @IBAction func unwindToContactList(segue : UIStoryboardSegue) {
        if let viewController = segue.source as? AddContactViewController {
            switch segue.identifier {
            case "unwindToContactList":
                print(123)
            case "unwindToContactListAndSave":
                guard let name = viewController.nameTextField.text, let number = viewController.numberTextField.text else {
                    return
                }
                let contact = Contact(name: name, number: number)
                if let indexPath = viewController.indexPath {
                    contacts[indexPath.row] = contact
                } else {
                    contacts.append(contact)
                }
                tableView.reloadData()
            default:
                print(456)
            }
            
        } else if let viewController = segue.source as? ContactDetailViewController {
            if viewController.isDeleted {
                guard let indexPath = viewController.indexPath else { return }
                contacts.remove(at: indexPath.row)
                tableView.reloadData()
            } else {
                guard let indexPath = viewController.indexPath else { return }
                contacts[indexPath.row] = viewController.contact!
                tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactDetailSegue" {
            guard let viewNavigationController = segue.destination as? UINavigationController else { return }
            guard let viewController = viewNavigationController.topViewController as? ContactDetailViewController else { return }
            guard let index =  tableView.indexPathForSelectedRow else { return }
            let contact = contacts[index.row]
            viewController.contact = contact
            viewController.indexPath = index
        }
    }
    
    
    
    
    
    

}
