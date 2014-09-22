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
    @IBOutlet weak var businessImage: UIImageView!
    @IBOutlet weak var businessRatingImageSmall: UIImageView!

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
        setImageAsyn(businessDetail.BusinessRatingThumbnailURL(), imageView: self.businessRatingImageSmall);
        setImageAsyn(businessDetail.BusinessThumbnailURL(), imageView: self.businessImage);
    }
    
    func setImageAsyn(stringURL: NSString, imageView:UIImageView) {
        var req:NSURLRequest = NSURLRequest(URL: NSURL(string:stringURL));
        let imageRequestSuccess = {
            (request : NSURLRequest!, response : NSHTTPURLResponse!, image : UIImage!) -> Void in
            imageView.image = image;
            imageView.setNeedsLayout();
        }
        let imageRequestFailure = {
            (request : NSURLRequest!, response : NSHTTPURLResponse!, error : NSError!) -> Void in
            NSLog("imageRequrestFailure")
        }
        
        imageView.setImageWithURLRequest(req, placeholderImage:nil, success:imageRequestSuccess, failure:imageRequestFailure);
    }
}
