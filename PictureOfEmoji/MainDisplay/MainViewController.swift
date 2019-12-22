//
//  ViewController.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 27.11.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController  {

    
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var sourceImage: UIImageView!
    
    @IBOutlet weak var changeInEmojiButton: UIButton!
    
   // @IBOutlet weak var saveButton: UIButton!
    
    private lazy var presenter: IMainPresenter = {
        let presenter = MainPresenter(view: self)
        return presenter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewReadyEvent()
        changeInEmojiButton.layer.cornerRadius = 6
        historyButton.layer.cornerRadius = 6
       // saveButton.layer.cornerRadius = 6

        
    }

    @IBAction func tapButtonLoading(_ sender: Any) {
        presenter.onButtonTapEvent()
    }
    
    @IBAction func tapButtonChangeInEmoji(_ sender: Any) {
        presenter.onButtonTapChangeImage(image: self.sourceImage.image)
    }
    
//    @IBAction func tabButtonSaveImage(_ sender: Any) {
//        presenter.saveImage(emojiImage: self.sourceImage.image!, fileName: "\(Date().timeIntervalSinceReferenceDate)")
//    }
    @IBAction func tapHistoryButton(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
//        (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = vc
        presenter.onTapHistory()
    }
    
}


extension MainViewController:IMainViewController {
    var urlText: String? {
        return self.urlTextField.text
    }
    
    func setupInitialState() {
        title = "POE"
    }

    
    func updateImage(imageData: UIImage) {
//        sourceImage.image = UIImage(data: imageData)
        sourceImage.image = imageData
    }
    func changeImage(emojiImage: UIImage) {
        sourceImage.image = emojiImage
    }
}
