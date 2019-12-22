//
//  UserPlainObject.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 12.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import Foundation
import CoreData

class UserPlainObject {
    let userLogin: String
    let userPassword: String
    let imageEmojiData: [EmojiModel]
    
    init(userLogin: String, userPassword: String, imageData: [EmojiModel]) {
            self.userLogin = userLogin
            self.userPassword = userPassword
            self.imageEmojiData = imageData
        }

        init(userManaged: UserManaged) {
            self.userLogin = userManaged.login ?? "nil"
            self.userPassword = userManaged.password ?? ""
            self.imageEmojiData = userManaged.imageDTO?.allObjects as! [EmojiModel]
        }

}
extension UserPlainObject:CustomDebugStringConvertible {
    var debugDescription: String {
        return "\(userLogin) \(userPassword)\n"
    }
    
    
}
