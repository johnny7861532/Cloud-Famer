//
//  PeopleTableViewCell.swift
//  foodpin new
//
//  Created by Johnny' mac on 2016/2/5.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var locationLable: UILabel!
    @IBOutlet var typeLable: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
