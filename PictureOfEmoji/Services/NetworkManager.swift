//
//  NetworkManager.swift
//  PictureOfEmoji
//
//  Created by Kursant on 28/11/2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import Foundation
import UIKit

final class NetworkManager: INetworkManager {
    let session: URLSession
    var currentUser: UserPlainObject?
    
    
    static let main: NetworkManager = {
        let sessionConfiguration = URLSessionConfiguration.default
        let result = NetworkManager(sessionConfiguration: sessionConfiguration)
        return result
    }()
    
    init(sessionConfiguration: URLSessionConfiguration) {
        self.session = URLSession(configuration: sessionConfiguration)
    }
    
    
   
    
    @discardableResult
    func loadImage(urlAdress: String, completion: @escaping (UIImage) -> Void)-> URLSessionDownloadTask {
        
        let url = URL(string: urlAdress)
//        if let url = URL(string: urlAdress){
//            assertionFailure("Url missing")
//        }
        


        let task = session.downloadTask(with: url!) { (url,response,error) in
//            if let error = error {
//            completion(.failure(error))
//            return
//            }
//            if let response = response as? HTTPURLResponse{
//                print(response.statusCode)
//            }
            let imageData = try! UIImage(data: Data(contentsOf: url!))
            completion(imageData!)
        }
        
        task.resume()
        return task
        }
    
}

//func loadImage(url: URL, completion: @escaping (UIImage) -> Void) -> URLSessionDownloadTask {
//
//    let task = session.downloadTask(with: url) { (url, response, error) in
//
//        let imageData = try! UIImage(data: Data(contentsOf: url!))
//        completion(imageData!)
//    }
//
//    task.resume()
//    return task
//}
