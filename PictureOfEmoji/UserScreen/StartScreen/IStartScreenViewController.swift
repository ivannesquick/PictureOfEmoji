//
//  IStartScreenViewController.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 01.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import Foundation

protocol IStartScreenViewController:AnyObject {
    func setupInitialState()
    func alertController()
}

