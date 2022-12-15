//
//  CachedFriend+CoreDataProperties.swift
//  bread and butter
//
//  Created by Arthur Sh on 14.12.2022.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var thatsFriend: CachedUser?

}

extension CachedFriend : Identifiable {

}
