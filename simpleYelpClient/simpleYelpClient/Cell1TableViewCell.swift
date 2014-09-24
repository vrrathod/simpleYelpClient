//
//  SwitchTableViewCell.swift
//  YelpHomework
//
//  Created by Franklin Ho on 9/21/14.
//  Copyright (c) 2014 Franklin Ho. All rights reserved.
//

import UIKit

class Cell1TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var switchDeal: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        self.switchDeal.userInteractionEnabled = false
        
    }
    
    func setLabel ( lbl:NSString ) {
        self.label.text = lbl;
    }
 
    func setSwitch ( state:Bool ) {
        self.switchDeal.on = state;
    }
}
