//
//  ViewController.swift
//  simpleYelpClient
//
//  Created by vr on 9/21/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    // Client object for making Yelp queries.
    var client:YelpClient = YelpClient(consumerKey: YelpConstants.CONSUMER_KEY(),
                                       consumerSecret: YelpConstants.CONSUMER_SECRET(),
                                       accessToken: YelpConstants.ACCESS_TOKEN(),
                                       accessSecret: YelpConstants.ACCESS_SECRET() );
    
    /// contents of the table is stored in following array
    var tableContents: NSArray? ;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //----------------------------------------------------------------------------
    // Table View Data Source
    //----------------------------------------------------------------------------
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if nil != tableContents  {
            return tableContents!.count;
        } else {
            return 0;
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("vr.codepath.yelp.cell" ) as? UITableViewCell;
        return cell!;
    }

    //----------------------------------------------------------------------------

}

