//
//  IRegistrationScreen.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 02.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import Foundation

protocol IRegistrationScreenViewController:AnyObject {
    func setupInitialState(userLogin: String, isLoginAbsent: Bool)
}
