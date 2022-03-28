//
//  DetailViewController.swift
//  TaskAssignmentApp
//
//  Created by Mac-003 on 25/03/22.
//

import Foundation
import UIKit


class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblFamily: UILabel!
    
    var currCharID = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.viewInitialise()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func viewInitialise() {
        
        NetworkManager.getCharacter(charId: currCharID) { [self] (charModel) in
            imgCharacter.imageFromURL(urlString: charModel.imageUrl)
            
            lblFirstName.text = "First Name: " + charModel.firstName
            lblLastName.text = "Last Name: " + charModel.lastName
            lblFullName.text = "Full Name: " + charModel.fullName
            lblTitle.text = "Title: " + charModel.title
            lblFamily.text = "Family: " + charModel.family
        }
        
    }
    
    @IBAction func btnBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
        
    
}
