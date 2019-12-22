//
//  TableViewController.swift
//  PictureOfEmoji
//
//  Created by Kursant on 19/12/2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,ITableViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var networkManager = NetworkManager.main
    private var cacheService = CacheService()
    private let presenter = TableViewPresenter()
    var selectedIndexPath: IndexPath = IndexPath()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.inject(view: self)
        presenter.onViewReadyEvent()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setupInitialState(emojiModel: [EmojiModel]) {
        title = "History"
        
        
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "ImageTableViewCell")
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
    }
    
    

}

extension TableViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return presenter.numberOfRowsInSection(section: section)
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = self.networkManager.currentUser
           let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
           let item = presenter.itemForRowAtIndexPath(indexPath: indexPath)
        cell.configureWith(item: item,user: user!)
           
           return cell
       }
}
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//   let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
//   cell.textLabel?.text = self.data[indexPath.row]
//   return cell
//}
