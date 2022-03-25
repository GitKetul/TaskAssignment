//
//  ViewController.swift
//  TaskAssignmentApp
//
//  Created by Mac-003 on 25/03/22.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet weak var tblCharacter: UITableView! {
        didSet {
            tblCharacter.register(UINib(nibName: "CharacterTblCell", bundle: nil), forCellReuseIdentifier: "CharacterTblCell")
        }
    }
    
    var arrCharacter = [CharacterModel]() {
        didSet {
            tblCharacter.reloadData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.tblCharacter.layer.cornerRadius = 10.0
//        self.tblCharacter.clipsToBounds = true
        getDataFromServer()

    }

    private func getDataFromServer() {
        
        NetworkManager.getList { (postModel) in
            self.arrCharacter = postModel
        }
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCharacter.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0;//Choose your custom row height
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTblCell") as? CharacterTblCell {
            
            cell.configure(arrCharacter[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
}

