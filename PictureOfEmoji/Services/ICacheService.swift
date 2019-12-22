//
//  ICacheService.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 15.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import UIKit
import CoreData

protocol ICacheService:AnyObject {
    func cacheUser(userPlaiObject: UserPlainObject) -> UserManaged?
}
