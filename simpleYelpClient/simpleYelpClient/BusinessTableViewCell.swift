//
//  BusinessTableViewCell.swift
//  simpleYelpClient
//
//  Created by vr on 9/21/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {
    @IBOutlet weak var businessName: UILabel!

    var businessDetail:YelpBusiness = YelpBusiness();
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setBusinessDetails( details:NSDictionary ) {
        businessDetail.setBusinessDetails(details);
        
        self.businessName.text = businessDetail.BusinessName();
    }
    
}
