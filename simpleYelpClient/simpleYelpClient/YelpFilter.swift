//
//  YelpFilter.swift
//  simpleYelpClient
//
//  Created by vr on 9/21/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import UIKit

// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
enum SortingStyle {
    case eYelpSortBestMatch
    case eYelpSortDistance
    case eYelpSortHighestRated
};
// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
enum RadiusValues {
    case eYelpRadiusWalking
    case eYelpRadiusBiking
    case eYelpRadiusDriving
};
// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
class YelpFilter: NSObject {
    
    var category:NSString = ""; // TODO: make it an enum
    
    // Sorting style ==> lets default to best match
    var sort:SortingStyle = SortingStyle.eYelpSortBestMatch;
   
    // Radius style ==> lets default to driving distance
    var radius:RadiusValues = RadiusValues.eYelpRadiusDriving;
    
    // offering deals, lets default to false.
    var offeringDeals:Bool = false;
};
