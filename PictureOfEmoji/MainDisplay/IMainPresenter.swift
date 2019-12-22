//
//  IMainPresenter.swift
//  PictureOfEmoji
//
//  Created by Kursant on 28/11/2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import Foundation
import UIKit

protocol IMainPresenter: AnyObject {
    func onViewReadyEvent()
    func onButtonTapEvent()
    func onButtonTapChangeImage(image: UIImage?)
    func saveImage(emojiImage: UIImage?, fileName: String)
    func onTapHistory()
}
