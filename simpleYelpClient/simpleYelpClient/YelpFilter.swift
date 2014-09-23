//
//  YelpFilter.swift
//  simpleYelpClient
//
//  Created by vr on 9/21/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import UIKit

// ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ====
// ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ====
enum SortingStyle {
    case eYelpSortBestMatch
    case eYelpSortDistance
    case eYelpSortHighestRated
};
// ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ====
enum RadiusValues {
    case eYelpRadiusHere
    case eYelpRadiusWalking
    case eYelpRadiusBiking
    case eYelpRadiusDriving
};

// ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ====
class YelpFilter: NSObject {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    var category:NSString = ""; // TODO: make it an enum
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // sorting options : Default best match
    var sort:SortingStyle = SortingStyle.eYelpSortBestMatch;

    func sortValue() -> NSInteger {
        switch( sort ) {
        case .eYelpSortBestMatch: return 0;
        case .eYelpSortDistance: return 1;
        case .eYelpSortHighestRated: return 2;
        default: return 0;
        }
    }
   
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // radius: meters : Default driving
    var radius:RadiusValues = RadiusValues.eYelpRadiusDriving;
    
    func radiusValue () -> NSInteger {
        switch( radius ){
        case .eYelpRadiusHere: return 500;
        case .eYelpRadiusWalking: return 1000;
        case .eYelpRadiusBiking: return 2000;
        case .eYelpRadiusDriving: return 5000;
        default: return 500;
        }
    }
    
    func setRadiusWithValue(value:NSInteger) {
        if( value <= 500) {
            radius = RadiusValues.eYelpRadiusHere;
        } else if ( value <= 1000 ) {
            radius = RadiusValues.eYelpRadiusWalking;
        } else if ( value <= 2000 ) {
            radius = RadiusValues.eYelpRadiusBiking;
        } else {
            radius = RadiusValues.eYelpRadiusDriving;
        }
    }

    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // offering deals, lets default to false.
    var offeringDeals:Bool = false;
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    func requestForGet() -> NSString {
        var reqString:NSMutableString = NSMutableString();
        // sorting
        reqString.appendFormat("&sort=\(sortValue())");
        // radius
        reqString.appendFormat("&radius_filter=\(radiusValue())");
        // deals
        reqString.appendFormat("&deals_filter=\(offeringDeals)");
        // category
        // reqString.appendFormat("&category_filter=\(category)");
        
        return reqString;
    }
};
