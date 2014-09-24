//
//  FilterViewController.swift
//  simpleYelpClient
//
//  Created by vr on 9/23/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import UIKit


class FilterViewController: UITableViewController, UITableViewDataSource{
    //----------------------------------------------------------------------------
    @IBOutlet var filterSettingsTable: UITableView!
    
    //----------------------------------------------------------------------------
    var filterSettings:YelpFilter = YelpFilter();
    
    // lets have a delegation for updating filter
    var filterDelegate:ViewControllerDelegate?;
    
    func setFilterSettings( settings: YelpFilter ) {
        filterSettings = settings.copy() as YelpFilter;
    }
    
    //----------------------------------------------------------------------------
    // Mark : UI info
    var sectionNames:NSArray = NSArray(objects: "Deals","Sort","Distance");
    
    func sectionNameAtIndex(index:NSInteger) -> NSString {
        return sectionNames[index] as NSString;
    }
    
    var sortNames:NSArray = NSArray(objects: "Best Match", "Distance", "Highest Rated");
    func sortNameAtIndex( index:NSInteger ) -> NSString {
        return sortNames[index] as NSString;
    }

    var distanceNames:NSArray = NSArray(objects: "Here", "Walking", "Biking", "Driving");
    func distanceNameAtIndex( index:NSInteger ) -> NSString {
        return distanceNames[ index ] as NSString;
    }
    
    var isSortExpanded = false;
    var isDistanceExpanded = false;
    
    //----------------------------------------------------------------------------
    // Filter values
//    var distanceFilter = 0
//    var sortByFilter = 0
    
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
    
    //---
    // Table View Data Source
    //---
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Checks if section is expanded. If it is show all rows. If not, show only top row.
        switch( section ) {
        case 0: return 1;
        case 1: if ( isSortExpanded ) { return sortNames.count; } else { return 1; }
        case 2: if ( isDistanceExpanded ) { return distanceNames.count; } else { return 1; }
        default: return 1;
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellRow: Int!
        
        // Checks section that the cell is in
        if ((indexPath.section) == 0){
            // Deals section uses the standard UI Switch prototype cell
            var cell = tableView.dequeueReusableCellWithIdentifier("Cell1") as Cell1TableViewCell
            cell.setSwitch( filterSettings.offeringDeals );
            return cell;
            
        } else if ((indexPath.section) == 1 ){
            var cell = tableView.dequeueReusableCellWithIdentifier("Cell2") as Cell2TableViewCell
            cellRow = ( true == isSortExpanded ) ? indexPath.row : filterSettings.sortValue();
            cell.setLabel(sortNameAtIndex(cellRow));
            cell.selectButton( cellRow == filterSettings.sortValue() )
            
            return cell
        } else {
            // Same as distance section.
            var cell = tableView.dequeueReusableCellWithIdentifier("Cell2") as Cell2TableViewCell
            cellRow = ( true == isDistanceExpanded ) ? indexPath.row : filterSettings.radiusValue() ;
            cell.setLabel( distanceNameAtIndex( cellRow ) ) ;
            cell.selectButton(cellRow == filterSettings.radiusValue());
            return cell
        }
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Names sections.
        return sectionNameAtIndex( section );
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if ((indexPath.section) == 0){
            filterSettings.offeringDeals = !filterSettings.offeringDeals;
            
        } else if( (indexPath.section) == 1 ){
            // If other sections are already expanded, set selection to the filter value.
            if isSortExpanded == true {
                filterSettings.setSortValue(indexPath.row);
                isSortExpanded = false
            } else {
                //For all other sections, if the section is collapsed, expand it.
                isSortExpanded = true
                
            }
        } else if ( ( indexPath.section ) == 2 ) {
            // If other sections are already expanded, set selection to the filter value.
            if isDistanceExpanded == true {
                filterSettings.setRadiusWithValue( indexPath.row );
                isDistanceExpanded = false;
            } else {
                //For all other sections, if the section is collapsed, expand it.
                isDistanceExpanded = true
            }
        }
        
        // Clear selection after user has made the selection.
        if( filterSettingsTable.indexPathForSelectedRow() != nil ){
            filterSettingsTable.deselectRowAtIndexPath( filterSettingsTable.indexPathForSelectedRow()!, animated: true )
        }
        
        // Reload section and animate it with the automatic animation.
        self.filterSettingsTable.reloadSections( NSIndexSet( index: indexPath.section ), withRowAnimation: UITableViewRowAnimation.Automatic )
        
    }
}
