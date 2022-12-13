//
//  Friend.swift
//  bread and butter
//
//  Created by Arthur Sh on 13.12.2022.
//

import Foundation


struct Friend: Codable, Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friendss]
}


struct Friendss: Codable, Identifiable {
    var id: String
    var name: String
}
