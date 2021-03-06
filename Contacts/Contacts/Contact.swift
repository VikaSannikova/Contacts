//
//  Contact.swift
//  Contacts
//
//  Created by user on 18.03.2021.
//

import Foundation
struct Contact: Codable, Hashable {
    var id: Int = 0
    var firstName: String
    var lastName: String
    var email: String
    var phone: String

    enum CodingKeys: String, CodingKey {
        case firstName = "firstname"
        case lastName = "lastname"
        case email
        case phone
    }
    
    init ( firstName: String, lastName: String, email: String, phone: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.id = self.hashValue
       }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(firstName)
        hasher.combine(lastName)
        hasher.combine(email)
        hasher.combine(phone)
        hasher.combine(arc4random())
    }
}
