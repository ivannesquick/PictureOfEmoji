//
//  IRegistrationScreenPresenter.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 02.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import Foundation

protocol IRegistrationScreenPresenter:AnyObject {
    func onViewReadyEvent()
    func onSignUpTapped(userLogin:String, userPassword:String)
}
