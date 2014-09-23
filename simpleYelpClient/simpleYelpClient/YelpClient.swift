//
//  YelpClient.swift
//  simpleYelpClient
//
//  Created by vr on 9/21/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import UIKit

class YelpClient: BDBOAuth1RequestOperationManager {
    
    // overriding initialization
    required init(consumerKey:NSString, consumerSecret:NSString, accessToken:NSString, accessSecret:NSString) {
        super.init(baseURL: YelpConstants.BASE_URL(), consumerKey: consumerKey, consumerSecret: consumerSecret);
        var token:BDBOAuthToken = BDBOAuthToken(token: accessToken, secret: accessSecret, expiration: nil);
        self.requestSerializer.saveAccessToken(token);
    }

    // overriding init method
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    var filterParams:NSMutableDictionary = NSMutableDictionary();
    
    func setSortFilter( value : NSInteger ) {
        filterParams["sort"] = value;
    }
    
    func setDistanceFilter ( value : NSInteger ) {
        filterParams["radius_filter"] = value;
    }
    
    func setDealsFilter( value : Bool ) {
        filterParams["deals_filter"] = value;
    }
    
    //------------------------------------------------------------------------------------------------
    func searchWithTerm(term:NSString, success:((operation:AFHTTPRequestOperation!, responseObject:AnyObject!)->Void), failure:((operation:AFHTTPRequestOperation!, error:NSError!)->Void)) -> AFHTTPRequestOperation {
        
        //TODO: update locaiton to be more precise
        var params:NSMutableDictionary = NSMutableDictionary(dictionary: filterParams);
        params["term"] = term;
        params["location"] = "San Francisco";
                
        return self.GET("search", parameters: params, success: success, failure: failure);
    }
    
    //------------------------------------------------------------------------------------------------
}
