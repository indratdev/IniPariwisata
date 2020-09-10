//
//  TouristSitesTableViewCell.swift
//  IniPariwisata
//
//  Created by IndratS on 13/08/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import UIKit

class TouristSitesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTouristSites: UILabel!
    @IBOutlet weak var imageTouristSites: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
