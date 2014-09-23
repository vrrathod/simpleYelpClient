//
//  FilterViewController.swift
//  simpleYelpClient
//
//  Created by vr on 9/23/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import UIKit


class FilterViewController: UIViewController {
    
    //----------------------------------------------------------------------------
    var filterSettings:YelpFilter = YelpFilter();

    // lets have a delegation for updating filter
    var filterDelegate:ViewControllerDelegate?;
    
    func setFilterSettings( settings: YelpFilter ) {
        filterSettings = settings.copy() as YelpFilter;
    }
    
    //----------------------------------------------------------------------------
    
    @IBOutlet weak var segSortBy: UISegmentedControl!
    @IBOutlet weak var segRadius: UISegmentedControl!
    @IBOutlet weak var switchOfferingDeals: UISwitch!
    var searchButton:UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        switch ( filterSettings.sort ) {
        case .eYelpSortBestMatch: segSortBy.selectedSegmentIndex = 0;
        case .eYelpSortDistance: segSortBy.selectedSegmentIndex = 1;
        case .eYelpSortHighestRated: segSortBy.selectedSegmentIndex = 2;
        default: segSortBy.selectedSegmentIndex = 0;
        }
        
        switch ( filterSettings.radius ){
        case .eYelpRadiusHere: segRadius.selectedSegmentIndex = 0;
        case .eYelpRadiusWalking: segRadius.selectedSegmentIndex = 1;
        case .eYelpRadiusBiking: segRadius.selectedSegmentIndex = 2;
        case .eYelpRadiusDriving: segRadius.selectedSegmentIndex = 3;
        default: segRadius.selectedSegmentIndex = 0;
        }
        
        switchOfferingDeals.on = filterSettings.offeringDeals;
        
        // Search button on the bar
        searchButton = UIBarButtonItem(title: "Search", style: UIBarButtonItemStyle.Bordered, target: self, action: "searchClicked:");
        self.navigationItem.rightBarButtonItem = searchButton;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sortingChanged(sender: AnyObject) {
        filterSettings.setSortValue( sender.selectedSegmentIndex );
    }
    
    @IBAction func distancePrefChanged(sender: AnyObject) {
        filterSettings.setRadiusWithSegmentIndex(sender.selectedSegmentIndex);
    }
    
    @IBAction func offerringDealsChanged(sender: AnyObject) {
        filterSettings.offeringDeals = (sender as UISwitch).on;
    }
    
    func searchClicked( sender: AnyObject ) {
        filterDelegate?.updateSettings(filterSettings);
        self.navigationController?.popViewControllerAnimated(true);
    }
}
