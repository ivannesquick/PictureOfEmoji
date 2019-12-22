//
//  TableViewPresenter.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 21.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import UIKit

class TableViewPresenter {
    private var emojiModel:[EmojiModel] = []
    private weak var view: ITableViewController?
    private var cacheService = CacheService()
    private var networkManager = NetworkManager.main
    private var tableCell = ImageTableViewCell()
    
    func onViewReadyEvent(){
        let user = self.networkManager.currentUser
        self.emojiModel = cacheService.retrieveImage(user: user!)
        view?.setupInitialState(emojiModel: emojiModel)
    }
    func numberOfRowsInSection(section: Int) -> Int {
        
        return emojiModel.count
    }
    func itemForRowAtIndexPath(indexPath: IndexPath) -> EmojiModel {
        return emojiModel[indexPath.row]
    }
    func inject(view: ITableViewController){
        self.view = view
    }
    
}
