//
//  EmojiModel.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 30.11.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import UIKit
import CoreData


struct EmojiModel  {
    let createdDate: Date
    let imageData: Data
    
    init(createdDate: Date, imageData: Data) {
        self.createdDate = createdDate
        self.imageData = imageData
    }
    
    init(pictureManaged: PictureManaged) {
        self.createdDate = pictureManaged.created!
        self.imageData = pictureManaged.imageData!
    }
}
