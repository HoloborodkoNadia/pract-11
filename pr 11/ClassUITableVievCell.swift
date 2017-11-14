//
//  ClassUITableVievCell.swift
//  pr 11
//
//  Created by nadia on 03.11.17.
//  Copyright © 2017 nadia. All rights reserved.
//

import UIKit

class ClassUITableVievCell: UITableViewCell {

    @IBOutlet private weak var ibimageView: UIImageView!
    @IBOutlet private weak var ibTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none 
        // Initialization code
    }
    
    func update(titel: String, image:  UIImage)  {
        ibimageView.image = image
        ibTitle.text = titel
    }
    
}
