//
//  StartScreenViewController.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 01.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController,IStartScreenViewController {

    @IBOutlet weak var userLoginTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInbutton: UIButton!
    
    private lazy var presenter: IStartScreenPresenter = {
           let presenter = StartScreenPresenter(view: self)
           return presenter
       }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 10
        signInbutton.layer.cornerRadius = 10

       // signUpButton.layer.cornerRadius = 3
        presenter.onViewReadyEvent()
        
        let flag = UserDefaults.standard.bool(forKey: "flag")
        if flag {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController")
             (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = vc
//            if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene {
//                window.windows.first?.rootViewController = vc
//                self.present(vc, animated: true)
//            }
        }
        
    }
    func setupInitialState() {
        title = "Hello !"
    }
    
    
    
    
    @IBAction func signInTapped(_ sender: Any) {
        let userLogin = userLoginTextField.text!
        let userPassword = userPasswordTextField.text!
        let checkPassword = presenter.onSignInTapped(userLogin: userLogin, userPassword: userPassword)
        if checkPassword {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
//        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene {
//            window.windows.first?.rootViewController = vc
//            self.present(vc, animated: true)
//        }
            } else {
                    let alertController = UIAlertController(title: "No such user", message: "Register?", preferredStyle: .actionSheet)
                    
                    let registerAction = UIAlertAction(title: "Register", style: .default) { [weak self ] _ in
                        self?.signUpTapped(self!.signUpButton)
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    alertController.addAction(registerAction)
                    alertController.addAction(cancelAction)
                    self.present(alertController, animated: true)
                }
                
            }
        
    
   @IBAction func signUpTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController")
            self.navigationController?.pushViewController(vc, animated: true)
         //   presenter.onSignUpTapped(userLogin: userLoginTextField.text)
        }
}

extension StartScreenViewController {
    
    func alertController() {
        let alertController = UIAlertController(title: "No such user", message: "Register?", preferredStyle: .actionSheet)
        
        let registerAction = UIAlertAction(title: "Register", style: .default) { [weak self ] _ in
            self?.signUpTapped(self!.signUpButton)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(registerAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
        }
}
