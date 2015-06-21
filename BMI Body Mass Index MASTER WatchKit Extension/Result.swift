//
//  Result.swift
//
//
//  Created by Janus Broch Mols on 15/06/15.
//
//

import WatchKit
import Foundation

var ourUsersHeight:String! = ""
var ourUsersWeight:String! = ""


class Result: WKInterfaceController {
    
    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    @IBOutlet weak var aboutTheResultLabel: WKInterfaceLabel!
    
    var mode = String?()
    
    
    

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        mode = context as! String!
        NSLog(mode!)
        
        ourUsersHeight = ourUsersHeight.stringByReplacingOccurrencesOfString("]", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        ourUsersHeight = ourUsersHeight.stringByReplacingOccurrencesOfString("[", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        ourUsersWeight = ourUsersWeight.stringByReplacingOccurrencesOfString("]", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        ourUsersWeight = ourUsersWeight.stringByReplacingOccurrencesOfString("[", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        
        NSLog("Users Height:\(ourUsersHeight)")
        NSLog("Users weight:\(ourUsersWeight)")
        
        var Height : Float = NSString(string: ourUsersHeight).floatValue
        var Weight : Float = NSString(string: ourUsersWeight).floatValue
        NSLog("\(Height)")
        NSLog("\(Weight)")
        
        if mode == "Metric Method"{
            //BMI = ( Weight in Kilograms / ( Height in Meters x Height in Meters ) )
            var BMI = Weight / (Height * Height)
            NSLog("\(BMI)")
            resultLabel.setText(NSString(format: "Your BMI: %.01f", BMI) as String)
            var aboutTheResultText : String
           
            if (BMI <= 18.5){
                
                aboutTheResultLabel.setTextColor(UIColor.blueColor())
                aboutTheResultLabel.setText("Underweight")
            }
            if ((BMI >= 18.5) && (BMI <= 24.99)){
                
                aboutTheResultLabel.setTextColor(UIColor.greenColor())
                aboutTheResultLabel.setText("Normal Weight")
            }
            if ((BMI >= 25.0) && (BMI <= 29.99)){
                
                aboutTheResultLabel.setTextColor(UIColor.yellowColor())
                aboutTheResultLabel.setText("Overweight")
            }
            if ((BMI >= 30.0) && (BMI <= 34.99)){
                
                aboutTheResultLabel.setTextColor(UIColor.orangeColor())
                aboutTheResultLabel.setText("Obesity (Class 1)")
            }
            if ((BMI >= 35.0) && (BMI <= 39.99)){
                
                aboutTheResultLabel.setTextColor(UIColor.redColor())
                aboutTheResultLabel.setText("Obesity (Class 2)")
            }
            if (BMI >= 40.0){
                
                aboutTheResultLabel.setTextColor(UIColor.redColor())
                aboutTheResultLabel.setText("Morbid Obesity")
            }

            
            

        }
        else if mode == "Imperial Method"{
            //BMI = ( Weight in Pounds / ( Height in inches x Height in inches ) ) x 703
            var BMI = (Weight / (Height * Height)) * 703
            NSLog("\(BMI)")
            resultLabel.setText(NSString(format: "Your BMI: %.01f", BMI) as String)
            
            if (BMI <= 18.5){
                
                aboutTheResultLabel.setTextColor(UIColor.blueColor())
                aboutTheResultLabel.setText("Underweight")
            }
            if ((BMI >= 18.5) && (BMI <= 24.99)){
                
                aboutTheResultLabel.setTextColor(UIColor.greenColor())
                aboutTheResultLabel.setText("Normal Weight")
            }
            if ((BMI >= 25.0) && (BMI <= 29.99)){
                
                aboutTheResultLabel.setTextColor(UIColor.yellowColor())
                aboutTheResultLabel.setText("Overweight")
            }
            if ((BMI >= 30.0) && (BMI <= 34.99)){
                
                aboutTheResultLabel.setTextColor(UIColor.orangeColor())
                aboutTheResultLabel.setText("Obesity (Class 1)")
            }
            if ((BMI >= 35.0) && (BMI <= 39.99)){
                
                aboutTheResultLabel.setTextColor(UIColor.redColor())
                aboutTheResultLabel.setText("Obesity (Class 2)")
            }
            if (BMI >= 40.0){
                
                aboutTheResultLabel.setTextColor(UIColor.redColor())
                aboutTheResultLabel.setText("Morbid Obesity")
            }

        }
        
        
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
