//
//  INetworkManager.swift
//  PictureOfEmoji
//
//  Created by Kursant on 28/11/2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import Foundation
import UIKit

protocol INetworkManager:AnyObject {
    func loadImage(urlAdress: String, completion: @escaping (UIImage) -> Void)-> URLSessionDownloadTask
}
