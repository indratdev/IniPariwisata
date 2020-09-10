//
//  PariwisataTableViewCell.swift
//  IniPariwisata
//
//  Created by IndratS on 13/08/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import UIKit

class PariwisataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var labelBackground: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelBackground.textColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
        
}
