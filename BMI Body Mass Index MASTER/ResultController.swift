//
//  ResultController.swift
//
//
//  Created by Janus Broch Mols on 21/06/15.
//
//

import UIKit

var height: String!
var weight: String!
var modeMetric: Bool!

class ResultController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var aboutTheResultLabel: UILabel!
    
    @IBOutlet weak var background: UIImageView!
    
    var BMI : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addEffect()
        
        var Height : Float = NSString(string: height).floatValue
        var Weight : Float = NSString(string: weight).floatValue
        NSLog("\(Height)")
        NSLog("\(Weight)")
        
        
        
        if modeMetric == true{
            //BMI = ( Weight in Kilograms / ( Height in Meters x Height in Meters ) )
            BMI = Weight / (Height * Height)
            NSLog("\(BMI)")
            showResult()
        }
        else if modeMetric == false{
            //BMI = ( Weight in Pounds / ( Height in inches x Height in inches ) ) x 703
            BMI = (Weight / (Height * Height)) * 703
            NSLog("\(BMI)")
            showResult()
        }

        
        }
    
    
    func addEffect()
    {
        //add blur to background
        var effect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
        
        var effectView  = UIVisualEffectView(effect: effect)
        
        effectView.frame  = CGRectMake(0, 0, 2000, 2000)
        
        background.addSubview(effectView)
        
        
    }

        
        
    func showResult(){
        resultLabel.text = (NSString(format: "Your BMI: %.01f", BMI) as String)
        
        if (BMI <= 18.5){
            
            aboutTheResultLabel.textColor = (UIColor.blueColor())
            aboutTheResultLabel.text = ("Underweight")
        }
        if ((BMI >= 18.5) && (BMI <= 24.99)){
            
            aboutTheResultLabel.textColor = (UIColor.greenColor())
            aboutTheResultLabel.text = ("Normal Weight")
        }
        if ((BMI >= 25.0) && (BMI <= 29.99)){
            
            aboutTheResultLabel.textColor = (UIColor.yellowColor())
            aboutTheResultLabel.text = ("Overweight")
        }
        if ((BMI >= 30.0) && (BMI <= 34.99)){
            
            aboutTheResultLabel.textColor = (UIColor.orangeColor())
            aboutTheResultLabel.text = ("Obesity (Class 1)")
        }
        if ((BMI >= 35.0) && (BMI <= 39.99)){
            
            aboutTheResultLabel.textColor = (UIColor.redColor())
            aboutTheResultLabel.text = ("Obesity (Class 2)")
        }
        if (BMI >= 40.0){
            
            aboutTheResultLabel.textColor = (UIColor.redColor())
            aboutTheResultLabel.text = ("Morbid Obesity")
        }

    }

    
    
    
}



