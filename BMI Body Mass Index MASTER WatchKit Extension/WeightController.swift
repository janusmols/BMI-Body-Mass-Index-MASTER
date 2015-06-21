//
//  Weight.swift
//  
//
//  Created by Janus Broch Mols on 21/06/15.
//
//

import WatchKit
import Foundation


class Weight: WKInterfaceController {

    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    @IBOutlet weak var myTable: WKInterfaceTable!
    
    var arraySEC = Array<Array<Float>>()
    var NumbColumn = 249 //250
    var array = Array<Array<Float>>()
    var value :Float = 0.01
    var countInt = Int()
    var valuePlus :Float = 0.0
    var Units = ""
    var mode : String?
    var rowIndexVariable : Int = 0
    var userWeight = "test"
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        mode = context as! String!
        NSLog(mode!)
        if mode == "Metric Method"{
            
            NumbColumn = 299 //300
            valuePlus = 0.5
            value = 0.5
            Units = "kg"
        }
        else if mode == "Imperial Method"{
            
            NumbColumn = 299 //300
            valuePlus = 1
            value = 1
            Units = "pounds"
        }
        
        titleLabel.setText("Choose your Weight")
        populateData()
        
    }
    
    
    func populateData(){
        
        for column in 0...NumbColumn{
            var columnArray = Array<Float>()
            NSLog("value:\(value)")
            columnArray.append(value)
            value = value + valuePlus
            array.append(columnArray)
            arraySEC = array
            countInt = NumbColumn
        }
        
        NSLog("Array.Count:\(arraySEC.count)")
        myTable.setNumberOfRows(array.count, withRowType: "UsersTableRowControllerWeight")
        
        
        for (index, value) in enumerate(array){
            
            //          let rowold = myTable.rowControllerAtIndex(index) as! UsersTableRowController
            let row = myTable.rowControllerAtIndex(index) as! UsersTableRowControllerWeight
            NSLog("CountINT:\(countInt)")
            NSLog("arraySEC:\(arraySEC[countInt])")
            var myFloat = arraySEC[countInt]
            var titleText = (("\(myFloat) \(Units)"))
            
            titleText = titleText.stringByReplacingOccurrencesOfString("]", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            titleText = titleText.stringByReplacingOccurrencesOfString("[", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            
            row.titleLabel.setText(titleText)
            
            if countInt > 0{
                countInt--
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        rowIndexVariable = NumbColumn - rowIndex
        userWeight = "\(arraySEC[rowIndexVariable)" as String
        NSLog("Selected Weight:\(userWeight)")
        pushControllerWithName("Result", context: mode)
        ourUsersWeight = userWeight
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
