//
//  RadioTableViewCell.swift
//  YelpHomework
//
//  Created by Franklin Ho on 9/21/14.
//  Copyright (c) 2014 Franklin Ho. All rights reserved.
//

import UIKit

class Cell2TableViewCell: UITableViewCell {

    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var btn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.btn.userInteractionEnabled = false
        
    }
    
    func setLabel ( lbl:NSString ) {
        self.lbl.text = lbl;
    }
    
    func selectButton( select: Bool ) {
        self.btn.selected = select;
    }


}
