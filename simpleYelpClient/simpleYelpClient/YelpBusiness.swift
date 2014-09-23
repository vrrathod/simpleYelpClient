//
//  YelpBusiness.swift
//  simpleYelpClient
//
//  Created by vr on 9/21/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import Foundation

class YelpBusiness: NSObject {
    
    var dictBusinessDetails = NSDictionary();
    
    // SETTER FOR DICT
    func setBusinessDetails( details:NSDictionary ) {
        dictBusinessDetails = details;
    }
    
    // BASE GETTER : String
    func BusinessStringInfo(attribute:NSString) -> NSString {
        var attributes:NSArray = (dictBusinessDetails.allKeys as NSArray).filteredArrayUsingPredicate(NSPredicate(format: "SELF like[c] %@", attribute));
        if(attributes.count > 0 ){
            var business:NSString = dictBusinessDetails[attribute] as NSString;
            return business;
        } else {
            return "";
        }
    }
    
    func BusinessNumberInfo(attribute:NSString) -> NSNumber {
        var attributes:NSArray = (dictBusinessDetails.allKeys as NSArray).filteredArrayUsingPredicate(NSPredicate(format: "SELF like[c] %@", attribute));
        if(attributes.count > 0 ){
            var business:NSNumber = dictBusinessDetails[attribute] as NSNumber;
            return business;
        } else {
            return 0;
        }
    }
    
    func BusinessName() -> NSString {
        return BusinessStringInfo("name");
    }
    
    func BusinessThumbnailURL() -> NSString {
        return BusinessStringInfo("image_url");
    }
    
    func BusinessRatingThumbnailURL() -> NSString {
        return BusinessStringInfo("rating_img_url_small");
    }
    
    func BusinessReviewCount() -> NSNumber {
        return BusinessNumberInfo("review_count");
    }
    
}