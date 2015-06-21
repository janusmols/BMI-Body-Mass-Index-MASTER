//
//  Calculator.swift
//
//
//  Created by Janus Broch Mols on 11/06/15.
//
//

import WatchKit
import Foundation


class Height: WKInterfaceController {
    
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
    var userHeight = "test"
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        mode = context as! String!
        NSLog(mode!)
        if mode == "Metric Method"{
            
            NumbColumn = 249 //250
            valuePlus = 0.01
            value = 0.01
            Units = "Meters"
        }
        else if mode == "Imperial Method"{
            
            NumbColumn = 249 //250
            valuePlus = 0.4
            value = 0.4
            Units = "Inches"
        }
        
        titleLabel.setText("Choose your height")
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
        myTable.setNumberOfRows(array.count, withRowType: "UsersTableRowController")
        
        
        for (index, value) in enumerate(array){
            
//          let rowold = myTable.rowControllerAtIndex(index) as! UsersTableRowController
            let row = myTable.rowControllerAtIndex(index) as! UsersTableRowController
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
        userHeight = "\(arraySEC[rowIndexVariable)" as String
        NSLog("Selected Height:\(userHeight)")
        pushControllerWithName("Weight", context: mode)
        ourUsersHeight = userHeight
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
