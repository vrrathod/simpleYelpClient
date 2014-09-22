//
//  ViewController.swift
//  simpleYelpClient
//
//  Created by vr on 9/21/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    // Client object for making Yelp queries.
    var client:YelpClient = YelpClient(consumerKey: YelpConstants.CONSUMER_KEY(),
                                       consumerSecret: YelpConstants.CONSUMER_SECRET(),
                                       accessToken: YelpConstants.ACCESS_TOKEN(),
                                       accessSecret: YelpConstants.ACCESS_SECRET() );
    
    /// contents of the table is stored in following array
    var tableContents: NSArray? ;
    
    // control the url requests
    var pullHandler:UIRefreshControl = UIRefreshControl();

    // Outlet for the table
    @IBOutlet weak var yelpTable: UITableView!
    
    var searchBar:UISearchBar = UISearchBar();
    
    //----------------------------------------------------------------------------
    // View loading overrides
    //----------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        
//        pullHandler.attributedTitle = NSAttributedString(string: "Pull to refersh");
//        pullHandler.tintColor = UIColor.redColor();
//        pullHandler.addTarget(self, action: "updateTable:", forControlEvents: UIControlEvents.ValueChanged);
//        yelpTable.addSubview(pullHandler);
        
        // Update serializer
        client.responseSerializer = AFJSONResponseSerializer();
        
        // table view height 
        yelpTable.delegate = self;
        
        // Add search bar to the
        searchBar.searchBarStyle = UISearchBarStyle.Minimal;
        searchBar.sizeToFit();
        var orig:CGPoint = searchBar.frame.origin;
        var size:CGSize = searchBar.frame.size;
        searchBar.frame = CGRect(origin: orig, size: CGSize(width: size.width-60, height: size.height));
        searchBar.delegate = self;
        var searchView:UIView = UIView(frame: searchBar.frame);
        searchView.addSubview(searchBar)
        self.navigationItem.titleView = searchView;

        //TODO: Add spinner for loading events
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        //TODO: default to last search term.
        //TODO: i.e. serialize what user searched last time.
        client.searchWithTerm("", success: successHandler, failure: failureHandler);
    }

    //----------------------------------------------------------------------------
    // Memory warning overrides
    //----------------------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //----------------------------------------------------------------------------
    // Table View : Data Source
    //----------------------------------------------------------------------------
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if nil != tableContents  {
            return tableContents!.count;
        } else {
            return 0;
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: BusinessTableViewCell? = tableView.dequeueReusableCellWithIdentifier("vr.codepath.yelp.cell" ) as? BusinessTableViewCell;
        var dict:NSDictionary = self.tableContents![indexPath.row] as NSDictionary ;
        cell?.setBusinessDetails(dict);
        return cell!;
    }
    
    //----------------------------------------------------------------------------
    // Table View : View Delegate
    //----------------------------------------------------------------------------
//    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 50;
//    }

    //----------------------------------------------------------------------------
    // Helper methods
    //----------------------------------------------------------------------------
    func successHandler(request:AFHTTPRequestOperation!, inResult:AnyObject!) -> Void {
        NSLog("All Right! we've got some data to process!");
//        NSLog("\(inResult)");
        self.tableContents = inResult["businesses"] as? NSArray;
        self.yelpTable.reloadData();
        self.pullHandler.endRefreshing();
    }
    
    func failureHandler(request:AFHTTPRequestOperation!, error:NSError!) -> Void {
        NSLog("Derp! error \(error.localizedDescription)");
        // TODO: lets setup network error message here
    }

    func updateTable(sender:AnyObject?) {
        //TODO: update list here
        NSLog("updateTable");
    }
    
    //----------------------------------------------------------------------------
    // Search Bar delegate
    //----------------------------------------------------------------------------

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        client.searchWithTerm(searchBar.text, success: successHandler , failure: failureHandler);
        searchBar.endEditing(true);
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = "";
        client.searchWithTerm(searchBar.text, success: successHandler , failure: failureHandler);
        searchBar.endEditing(true);
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.searchBar.endEditing(true);
    }
}

