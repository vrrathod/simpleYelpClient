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
    
    func setSortValue( value:NSInteger ) {
        switch ( value ) {
        case 0: sort = SortingStyle.eYelpSortBestMatch;
        case 1: sort = SortingStyle.eYelpSortDistance;
        case 2: sort = SortingStyle.eYelpSortHighestRated;
        default:
            sort = SortingStyle.eYelpSortBestMatch
        }
    }
   
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // radius: meters : Default driving
    var radius:RadiusValues = RadiusValues.eYelpRadiusDriving;
    
    func radiusValue () -> NSInteger {
        switch( radius ){
        case .eYelpRadiusHere: return 1000;
        case .eYelpRadiusWalking: return 1600;
        case .eYelpRadiusBiking: return 3200;
        case .eYelpRadiusDriving: return 5000;
        default: return 500;
        }
    }
    
    func setRadiusWithValue(value:NSInteger) {
        if( value <= 1000) {
            radius = RadiusValues.eYelpRadiusHere;
        } else if ( value <= 1600 ) {
            radius = RadiusValues.eYelpRadiusWalking;
        } else if ( value <= 3200 ) {
            radius = RadiusValues.eYelpRadiusBiking;
        } else {
            radius = RadiusValues.eYelpRadiusDriving;
        }
    }
    
    func setRadiusWithSegmentIndex(value:NSInteger) {
        switch( value ) {
        case 0: radius = RadiusValues.eYelpRadiusHere;
        case 1: radius = RadiusValues.eYelpRadiusWalking;
        case 2: radius = RadiusValues.eYelpRadiusBiking;
        case 3: radius = RadiusValues.eYelpRadiusDriving;
        default: radius = RadiusValues.eYelpRadiusHere;
        }
    }


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // offering deals, lets default to false.
    var offeringDeals:Bool = false;
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
};
