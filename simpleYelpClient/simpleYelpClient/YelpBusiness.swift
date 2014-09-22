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
        var business:NSString = dictBusinessDetails[attribute] as NSString;
        if( business.length > 0 ) {
            return business;
        } else {
            return "Who knows!";
        }
    }
    
    func BusinessName() -> NSString {
        return BusinessStringInfo("name");
    }
    
    
}