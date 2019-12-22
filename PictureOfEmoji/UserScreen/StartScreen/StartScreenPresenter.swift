//
//  StartScreenPresenter.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 01.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import CoreData
import UIKit

class StartScreenPresenter:IStartScreenPresenter {
    
    private weak var view: IStartScreenViewController?
    private var networkManager = NetworkManager.main

    
    init(view: IStartScreenViewController) {
        self.view = view
    }
    func onViewReadyEvent() {
        view?.setupInitialState()
    }
//    func onSignUpTapped(userLogin: String?) {
//        
//     //   let userName = company.primitiveValue(forKey: "name")
//        if userLogin != "" {
//            UserDefaults.standard.set(userLogin, forKey: "userLogin")
//            UserDefaults.standard.set(false, forKey: "isLoginAbsent")
//        } else {
//            UserDefaults.standard.set("userLogin", forKey: "userLogin")
//            UserDefaults.standard.set(true, forKey: "isLoginAbsent")
//        }
//    }
    func onSignInTapped(userLogin: String, userPassword: String) -> Bool {
        var cacheService  = CacheService()
        let managedUser = cacheService.checkForEntities(with: userLogin, password: userPassword)
        if  managedUser != nil  {
            let user = UserPlainObject(userManaged: managedUser!)
            networkManager.currentUser = user
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = vc
        } else {
            view?.alertController()
        }
//        if  userPassword == UserDefaults.standard.string(forKey: userLogin){
//            return true
//        } else {
//            return false
//        }
    return true
    }
}
