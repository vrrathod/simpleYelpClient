//
//  FilterViewController.swift
//  simpleYelpClient
//
//  Created by vr on 9/23/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import UIKit


class FilterViewController: UITableViewController {
    //----------------------------------------------------------------------------
    @IBOutlet weak var pickerSort: UIPickerView!
    @IBOutlet weak var pickerDistance: UIPickerView!
    
    //----------------------------------------------------------------------------
    var filterSettings:YelpFilter = YelpFilter();

    // lets have a delegation for updating filter
    var filterDelegate:ViewControllerDelegate?;
    
    func setFilterSettings( settings: YelpFilter ) {
        filterSettings = settings.copy() as YelpFilter;
    }
    
    //----------------------------------------------------------------------------
    
    var searchButton:UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Search button on the bar
        searchButton = UIBarButtonItem(title: "Search", style: UIBarButtonItemStyle.Bordered, target: self, action: "searchClicked:");
        self.navigationItem.rightBarButtonItem = searchButton;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchClicked( sender: AnyObject ) {
        filterDelegate?.updateSettings(filterSettings);
        self.navigationController?.popViewControllerAnimated(true);
    }
}
