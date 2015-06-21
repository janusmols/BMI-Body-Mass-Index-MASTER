//
//  ViewController.swift
//  BMI Body Mass Index
//
//  Created by Janus Broch Mols on 11/06/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var metricBtn: UIButton!
    @IBOutlet weak var imperialBtn: UIButton!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    var metricMode = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var metricMode = true
        
        heightInput.placeholder = "Your height in meters"
        weightInput.placeholder = "Your weight in kilograms"
        
        imperialBtn.backgroundColor = UIColor.grayColor()
        
        metricBtn.backgroundColor = UIColor.blackColor()
        
        heightInput.delegate = self
        weightInput.delegate = self
        
        addEffect()

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch {
            self.view.endEditing(true)
        }
        super.touchesBegan(touches , withEvent:event)
    }
    

    func addEffect()
    {
        //add blur to background
        var effect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
        
        var effectView  = UIVisualEffectView(effect: effect)
        
        effectView.frame  = CGRectMake(0, 0, 2000, 2000)
        
        background.addSubview(effectView)
        
        
    }
    
    @IBAction func metricMode(sender: AnyObject) {
        
        var metricMode = true
        
        imperialBtn.backgroundColor = UIColor.grayColor()
        
        metricBtn.backgroundColor = UIColor.blackColor()
        
        heightInput.placeholder = "Your height in meters"
        weightInput.placeholder = "Your weight in kilograms"
        
    }
    
    

    @IBAction func imperialMode(sender: AnyObject) {
        
        var metricMode = false
        
        metricBtn.backgroundColor = UIColor.grayColor()
        
        imperialBtn.backgroundColor = UIColor.blackColor()
        
        heightInput.placeholder = "Your height in inches"
        weightInput.placeholder = "Your weight in pounds"
  
    }
    

    
    
    @IBAction func calculateAction(sender: AnyObject) {
        modeMetric = metricMode
        height = heightInput.text
        weight = weightInput.text
       }

}