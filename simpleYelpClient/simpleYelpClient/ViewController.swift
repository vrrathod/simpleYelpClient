//
//  ViewController.swift
//  simpleYelpClient
//
//  Created by vr on 9/21/14.
//  Copyright (c) 2014 vr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var client:YelpClient = YelpClient(consumerKey: YelpConstants.CONSUMER_KEY(),
                                       consumerSecret: YelpConstants.CONSUMER_SECRET(),
                                       accessToken: YelpConstants.ACCESS_TOKEN(),
                                       accessSecret: YelpConstants.ACCESS_SECRET() );

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

