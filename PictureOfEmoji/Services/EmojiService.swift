//
//  EmojiService.swift
//  PictureOfEmoji
//
//  Created by Kursant on 05/12/2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import UIKit


class EmojiService {
    
    

    func emoji(from image: UIImage) -> UIImage {
        
        let view = View(image: image, colorMap: try! createColorMap())
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let rendered = renderer.image { ctx in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        
        let result = UIImage(data: rendered.pngData()!)!
        return result
    }
}
