//
//  AddContactViewController.swift
//  Contacts
//
//  Created by user on 18.03.2021.
//

import UIKit

class AddContactViewController: UIViewController {
    
    var titleText: String = "ADD NEW CONTACT"
    var contact: Contact? = nil
    var indexPath: IndexPath? = nil

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
        if let editContact = contact {
            nameTextField.text = editContact.name
            numberTextField.text = editContact.number
        }
    }
    
    @IBAction func closeCancel(_ sender: UIButton) {
        if (titleLabel.text == "ADD NEW CONTACT") {
            nameTextField.text = nil
            numberTextField.text = nil
            performSegue(withIdentifier: "unwindToContactList", sender: self)
        } else if (titleLabel.text == "EDIT"){
            performSegue(withIdentifier: "backToDetails", sender: sender)
        }
    }
    
    @IBAction func saveAndClose(_ sender: UIButton) {
        if (titleLabel.text == "ADD NEW CONTACT") {
            performSegue(withIdentifier: "unwindToContactListAndSave", sender: self)
        } else if (titleLabel.text == "EDIT"){
            performSegue(withIdentifier: "backToDetailsAndSave", sender: self)
        }
    }
}