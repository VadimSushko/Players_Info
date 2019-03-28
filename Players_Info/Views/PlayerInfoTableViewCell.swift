//
//  PlayerInfoTableViewCell.swift
//  Players_Info
//
//  Created by Vadym Sushko on 3/27/19.
//  Copyright © 2019 Vadym Sushko. All rights reserved.
//

import UIKit

class PlayerInfoTableViewCell: UITableViewCell {
    
  

    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var footNameLabel: UILabel!
    @IBOutlet weak var currentSquadLabel: UILabel!
    @IBOutlet weak var parrentSquadLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.setUpView()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
