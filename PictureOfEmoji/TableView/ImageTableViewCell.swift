//
//  ImageTableViewCell.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 10.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var emojiImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    func configureWith(item:EmojiModel,user: UserPlainObject){
        let imageUI = UIImage(data: item.imageData)
        emojiImageView.image = imageUI
        userNameLabel.text = user.userLogin
//        var dateString = String(item.createdDate)
//        configureDate(date: dateString)

    }
//    func configureDate(date: String) {
//        dateLabel.text = date
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
