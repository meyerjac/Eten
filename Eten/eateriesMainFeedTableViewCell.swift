//
//  eateriesMainFeedTableViewCell.swift
//  Eten
//
//  Created by Jackson Meyer on 1/28/18.
//  Copyright © 2018 Jackson Meyer. All rights reserved.
//

import UIKit

class eateriesMainFeedTableViewCell: UITableViewCell {
    @IBOutlet weak var BusinessProfileImage: UIImageView!
    @IBOutlet weak var BusinessName: UILabel!
    @IBOutlet weak var firstSliderView: UIView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
