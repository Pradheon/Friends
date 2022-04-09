//
//  CachedFriend+CoreDataProperties.swift
//  Friends
//
//  Created by Joshan Rai on 4/8/22.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var users: CachedUser?

}

extension CachedFriend {
    var wrappedID: UUID {
        id ?? UUID()
    }
    
    var wrappedName: String {
        name ?? "nil"
    }
}

// MARK: Generated accessors for users
extension CachedFriend {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: CachedUser)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: CachedUser)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}

extension CachedFriend : Identifiable {

}
