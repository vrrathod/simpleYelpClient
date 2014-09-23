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

    func setFilterSettings( settings: YelpFilter ) {
        filterSettings = settings;
    }
    //----------------------------------------------------------------------------
    
    @IBOutlet weak var segSortBy: UISegmentedControl!
    @IBOutlet weak var segRadius: UISegmentedControl!

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    //----------------------------------------------------------------------------
    // segue
    //----------------------------------------------------------------------------
    
}
