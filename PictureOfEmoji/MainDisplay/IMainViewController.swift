//
//  IViewController.swift
//  PictureOfEmoji
//
//  Created by Kursant on 28/11/2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import Foundation
import class UIKit.UIImage

protocol IMainViewController: AnyObject {
    var urlText: String? { get }
    
    func updateImage(imageData: UIImage)
    func setupInitialState()
    func changeImage(emojiImage: UIImage)
}


