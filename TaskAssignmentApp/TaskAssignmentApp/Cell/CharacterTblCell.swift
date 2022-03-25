//
//  CharacterTblCell.swift
//  TaskAssignmentApp
//
//  Created by Mac-003 on 25/03/22.
//

import UIKit

final class CharacterTblCell: UITableViewCell {
    
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var imgCharacter: UIImageView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var viewCellContent: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewCellContent.setCardView()
        self.selectionStyle = .none

        
//        self.contentView.layer.cornerRadius = 5.0
//        self.contentView.layer.shadowColor = UIColor.gray.cgColor
//        self.contentView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        self.contentView.layer.shadowRadius = 12.0
//        self.contentView.layer.shadowOpacity = 0.7

        
    }
    
}

extension CharacterTblCell {
    
    func configure(_ charInfo: CharacterModel) {
        
        lblTitle.text = charInfo.title
        lblName.text = charInfo.fullName
        imgCharacter.imageFromURL(urlString: charInfo.imageUrl)
        
    }
}
