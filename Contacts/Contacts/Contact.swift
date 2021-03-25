//
//  Contact.swift
//  Contacts
//
//  Created by user on 18.03.2021.
//

import Foundation
struct Contact: Codable {
    private static var hashCode: Int = 0
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
        self.id = Contact.hashCode
        Contact.hashCode += 1
       }
}
