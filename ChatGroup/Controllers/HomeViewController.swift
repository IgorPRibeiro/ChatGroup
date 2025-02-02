//
//  ListChatsViewController.swift
//  ChatGroup
//
//  Created by Igor Pinheiro Ribeiro on 19/01/25.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
   

    var rooms: [Room] = [
        Room(name: "chat1", id: "1"),
        Room(name: "chat2", id: "2"),
        Room(name: "chat3", id: "3"),
        Room(name: "chat4", id: "4"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let userName = defaults.string(forKey: K.keyEmail) {
            let _name = userName.split(separator: "@")
            title = "Olá \(_name[0])"
        }else {
            title = "Olá user"
        }
        
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.cellChatNibName, bundle: nil), forCellReuseIdentifier: K.cellChatIdentifier)
        
        
    }
    
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellChatIdentifier, for: indexPath) as! ChatCell
        cell.label.text = rooms[indexPath.row].name
        return cell
    }
    
    
}
