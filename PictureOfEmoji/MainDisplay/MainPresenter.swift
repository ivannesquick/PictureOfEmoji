//
//  MainPresenter.swift
//  PictureOfEmoji
//
//  Created by Kursant on 28/11/2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import Foundation
import UIKit

class MainPresenter: IMainPresenter {
   
    
    private weak var view: IMainViewController?
    private let networkManager = NetworkManager.main
    private let emojiClass = EmojiService()
    private let cacheService = CacheService()
    private weak var tableViewController:ITableViewController?
    private var tableViewPresenter = TableViewPresenter()
    
    init(view: IMainViewController) {
        self.view = view
       
    }
    
    func onViewReadyEvent() {
        view?.setupInitialState()
    }
    
    func onButtonTapEvent() {
        
        let urlAdress = self.view?.urlText
        
        networkManager.loadImage(urlAdress: urlAdress!) { [weak self] image in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.view?.updateImage(imageData: image)
            }
        }
    }
    func onButtonTapChangeImage(image: UIImage?) {
        guard let image = image else { return }
        let emojiImage = self.emojiClass.emoji(from: image)
        self.view?.changeImage(emojiImage: emojiImage)
        let user = self.networkManager.currentUser
        //инициализировать
        let model = EmojiModel(createdDate: Date(), imageData: emojiImage.pngData()!)
        let imageData = emojiImage.pngData()
        cacheService.attach(currentUser: user!, imageEmojiData: model)
        
        // save Date() to coredata
        // save emojiImage.pngData() to coredata
    }
    
    func onTapHistory() {
        tableViewPresenter.onViewReadyEvent()
    }
    
    func saveImage(emojiImage: UIImage?, fileName: String) {
        
//        guard let emojiImage = emojiImage else { return }
//        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
//        let dataPath = documentsDirectory.appendingPathComponent("MyEmojiImages", isDirectory: true)
//
//        if !FileManager.default.fileExists(atPath: dataPath.path) {
//            do {
//                try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
//            } catch let error as NSError {
//                print(error.localizedDescription);
//            }
//        }
//
//        guard let data = emojiImage.jpegData(compressionQuality: 1.0) else {
//            return
//        }
//
//        let url = dataPath.appendingPathComponent("\(fileName).png")
//        print(url.path)
//        try? data.write(to: url)

    }
    

}
