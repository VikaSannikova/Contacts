//
//  Contact.swift
//  Contacts
//
//  Created by user on 18.03.2021.
//

import Foundation
struct Contact {
    private static var hashCode: Int = 0
    var id: Int
    var name: String
    var number: String
    
    init ( name: String, number: String) {
        self.name = name
        self.number = number
        self.id = Contact.hashCode
        Contact.hashCode += 1
       }
}
