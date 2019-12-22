//
//  PictureManaged+CoreDataProperties.swift
//  PictureOfEmoji
//
//  Created by  E.Tratotul on 12.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//
//

import Foundation
import CoreData


extension PictureManaged {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PictureManaged> {
        return NSFetchRequest<PictureManaged>(entityName: "Picture")
    }

    @NSManaged public var created: Date?
    @NSManaged public var imageData: Data?
    @NSManaged public var author: UserManaged?

}
