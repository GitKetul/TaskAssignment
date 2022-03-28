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
        getDataFromServer()

    }

    private func getDataFromServer() {
        
        NetworkManager.getList { (charModel) in
            self.arrCharacter = charModel
        }
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCharacter.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0;
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTblCell") as? CharacterTblCell {
            
            cell.configure(arrCharacter[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let CharVC = storyBoard.instantiateViewController(withIdentifier: "CharacterDetailViewController") as! CharacterDetailViewController
        CharVC.currCharID = "\(arrCharacter[indexPath.row].id)"
        self.present(CharVC, animated:false, completion:nil)

    }
}

