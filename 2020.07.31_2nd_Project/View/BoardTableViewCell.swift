//
//  BoardTableViewCell.swift
//  2020.07.31_2nd_Project
//
//  Created by Dustin on 2020/07/30.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class BoardTableViewCell: UITableViewCell {
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var likedBtn: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
