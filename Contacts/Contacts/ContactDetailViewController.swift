//
//  ContactDetailViewController.swift
//  Contacts
//
//  Created by user on 18.03.2021.
//

import UIKit

class ContactDetailViewController: UIViewController {
    var contact : Contact? = nil
    var isDeleted : Bool = false
    var indexPath: IndexPath? = nil
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactName.text = contact?.name
        contactNumber.text = contact?.number

    }
    @IBAction func doneBack(_ sender: Any) {
        performSegue(withIdentifier: "unwindToContacts", sender: self)
    }
    
    @IBAction func deleteContact(_ sender: Any) {
        isDeleted = true
        performSegue(withIdentifier: "unwindToContacts", sender: self)
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editContact") {
            guard let viewController = segue.destination as? AddContactViewController else { return }
            viewController.titleText = "EDIT"
            viewController.contact = self.contact
            viewController.indexPath = self.indexPath
        }
    }
    
    
    @IBAction func backToDetails(segue : UIStoryboardSegue) {
        if let viewController = segue.source as? AddContactViewController {
            switch segue.identifier {
            case "backToDetails":
                print(123)
            case "backToDetailsAndSave":
                guard let name = viewController.nameTextField.text, let number = viewController.numberTextField.text else {
                    return
                }
                contact?.name = name
                contact?.number = number
                contactName.text = contact?.name
                contactNumber.text = contact?.number
            default:
                print("what")
            }
        }
    }
}



