//
//  InterfaceController.swift
//  BMI Body Mass Index WatchKit Extension
//
//  Created by Janus Broch Mols on 11/06/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var metricMethodBtn: WKInterfaceButton!
 
    @IBOutlet weak var imperialMethodBtn: WKInterfaceButton!
    

    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    @IBAction func metricMethodAction() {
        pushControllerWithName("Height", context: "Metric Method")
    }

    @IBAction func imperialMethodAction() {
        pushControllerWithName("Height", context: "Imperial Method")
    }

    
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
