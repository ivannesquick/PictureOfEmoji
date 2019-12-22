//
//  RegistrationScreenPresenter.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 02.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import UIKit

class RegistrationScreenPresenter: IRegistrationScreenPresenter {
    private weak var view: IRegistrationScreenViewController?
    private var cacheService = CacheService()
    private var networkManager = NetworkManager.main
    
    
    
    init(view: IRegistrationScreenViewController){
        self.view = view
    }
    func onViewReadyEvent(){
        let isLoginAbsent = UserDefaults.standard.bool(forKey: "isLoginAbsent")
        if let userLogin = UserDefaults.standard.string(forKey: "userLogin") {
            view?.setupInitialState(userLogin: userLogin, isLoginAbsent: isLoginAbsent)
        } else {
            view?.setupInitialState(userLogin: "userLogin", isLoginAbsent: isLoginAbsent)
        }
    }
    
    func onSignUpTapped(userLogin: String, userPassword: String) {
        var cacheService  = CacheService()
        let plain = UserPlainObject(userLogin: userLogin, userPassword: userPassword, imageData: [])
        if let managedUser = cacheService.cacheUser(userPlaiObject: plain) {

            networkManager.currentUser = plain
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = vc
        } else {
        }

        
    }
}
