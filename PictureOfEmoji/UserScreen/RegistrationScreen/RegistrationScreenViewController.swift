//
//  RegistrationViewController.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 02.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import UIKit

class RegistrationScreenViewController: UIViewController,IRegistrationScreenViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var userLoginTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    private lazy var presenter: IRegistrationScreenPresenter = {
        let presenter = RegistrationScreenPresenter(view: self)
        return presenter
    }()
    
    func setupInitialState(userLogin: String, isLoginAbsent: Bool) {
        title = "Registration"
        userLoginTextField.text = userLogin
        userLoginTextField.clearsOnBeginEditing = isLoginAbsent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 10

        presenter.onViewReadyEvent()
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        let userLogin = userLoginTextField.text!
        let userPassword = userPasswordTextField.text!
        presenter.onSignUpTapped(userLogin:userLogin, userPassword:userPassword)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = vc
//        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene{
//            window.windows.first?.rootViewController = vc
//            self.present(vc, animated: true)
//        }
        
    }
    

}
