//
//  CachedUser+CoreDataProperties.swift
//  bread and butter
//
//  Created by Arthur Sh on 14.12.2022.
//
//

import Foundation
import CoreData


extension CachedUser {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }
    
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: String?
    @NSManaged public var tags: String?
    @NSManaged public var friends: String?
    @NSManaged public var thatsUser: NSSet?
    
    public var usersArray: [CachedUser] {
        let array = thatsUser as? Set<CachedUser> ?? []
        
        return array.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
   

    
    public var wrappedName: String {
        name ?? "Unkbown name"
    }
    
    public var wrappedId: String {
        id ?? "No id"
    }
    
    public var wrappedCompany: String {
        company ?? "No company"
    }
    
    public var wrappedEmail: String {
        email ?? "No email"
    }
    
    public var wrappedAddress: String {
        address ?? "No address"
    }
    
    public var wrappedAbout: String {
        about ?? "No info"
    }
    
    public var wrappedRegistered: String {
        registered ?? "no registration"
    }
    
    public var wrappedTags: String {
        tags ?? "No tags at all"
    }
    
    public var wrappedFriends: String {
        friends ?? "No friends"
    }
    
    
    

}

// MARK: Generated accessors for thatsUser
extension CachedUser {

    @objc(addThatsUserObject:)
    @NSManaged public func addToThatsUser(_ value: CachedFriend)

    @objc(removeThatsUserObject:)
    @NSManaged public func removeFromThatsUser(_ value: CachedFriend)

    @objc(addThatsUser:)
    @NSManaged public func addToThatsUser(_ values: NSSet)

    @objc(removeThatsUser:)
    @NSManaged public func removeFromThatsUser(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
