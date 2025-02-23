//
//  ListChatsViewController.swift
//  ChatGroup
//
//  Created by Igor Pinheiro Ribeiro on 19/01/25.
//

import UIKit
import Foundation
import FirebaseAuth
import FirebaseFirestore

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let db = Firestore.firestore()

   

    var rooms: [Room] = []
    
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
        
        loadRooms()
    }
    
    func loadRooms () {
        db.collection(K.FStore.roomsCollectionName).getDocuments { (querySnapshot, error) in
               if let error = error {
                   print("Erro ao buscar documentos: \(error.localizedDescription)")
                   return
               }
             
               if let snapshot = querySnapshot {
                   self.rooms = []
                   for document in snapshot.documents {
                       let documentID = document.documentID
                       let data = document.data()
                       print(data)
                       if let id = data["id"] as? String {
                           let newRoom = Room(name: documentID, id: String(id))
                           self.rooms.append(newRoom)
                           DispatchQueue.main.async{
                               self.tableView.reloadData()
                           }
                           
                       }else {
                           print("erro to get id")
                       }
                   }
                   
               }
           }
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
