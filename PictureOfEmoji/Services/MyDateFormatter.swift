//
//  DateFormatter.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 22.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import UIKit

final class MyDateFormatter {
    static let shared = MyDateFormatter()
    private var imageTableCell = ImageTableViewCell()
    
    private var dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd-MM-yyyy"
    }
    
    func string(from date: Date) -> String {
        
        return dateFormatter.string(from: date)
       // imageTableCell.configureDate(date: dateFormatter.string(from: date))
    }
}
