//
//  ITableViewController.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 21.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import UIKit

protocol ITableViewController: AnyObject {
    func setupInitialState(emojiModel: [EmojiModel])
}
