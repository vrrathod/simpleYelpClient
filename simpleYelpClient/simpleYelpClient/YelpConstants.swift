//
//  YelpConstants.swift
//  simpleYelpClient
//
//  Created by vr on 9/21/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import UIKit

class YelpConstants: NSObject {
    //----------------------------------------------------------------------------
    class func BASE_URL() -> NSURL {
        return NSURL(string:"http://api.yelp.com/v2/");
    }
    //----------------------------------------------------------------------------
    class func CONSUMER_KEY () -> NSString {
        return "FXsEJwYSLAv4iakAChQkhQ";
    }
    //----------------------------------------------------------------------------
    class func CONSUMER_SECRET() -> NSString {
        return "YJzvQObIG_BWFFEugOgcnPQ6wSo";
    }
    //----------------------------------------------------------------------------
    class func ACCESS_TOKEN() -> NSString {
        return "dbE8dNZQsiiV3aE1v_caKxqSDkEodov8";
    }
    //----------------------------------------------------------------------------
    class func ACCESS_SECRET() -> NSString {
        return "qnu0rq7Q5c5brQPZT6C0Nb5anR8";
    }
    //----------------------------------------------------------------------------

}
