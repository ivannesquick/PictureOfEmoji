//
//  UserManaged+CoreDataProperties.swift
//  PictureOfEmoji
//
//  Created by  E.Tratotul on 12.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//
//

import Foundation
import CoreData


extension UserManaged {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserManaged> {
        return NSFetchRequest<UserManaged>(entityName: "User")
    }

    @NSManaged public var login: String?
    @NSManaged public var password: String?
    @NSManaged public var imageDTO: NSSet?

}

// MARK: Generated accessors for imageDTO
extension UserManaged {

    @objc(addImageDTOObject:)
    @NSManaged public func addToImageDTO(_ value: PictureManaged)

    @objc(removeImageDTOObject:)
    @NSManaged public func removeFromImageDTO(_ value: PictureManaged)

    @objc(addImageDTO:)
    @NSManaged public func addToImageDTO(_ values: NSSet)

    @objc(removeImageDTO:)
    @NSManaged public func removeFromImageDTO(_ values: NSSet)

}
