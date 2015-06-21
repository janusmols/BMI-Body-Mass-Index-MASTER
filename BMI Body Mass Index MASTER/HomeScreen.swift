//
//  ViewController.swift
//  BMI Body Mass Index
//
//  Created by Janus Broch Mols on 11/06/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit
import iAd


class ViewController: UIViewController, UITextFieldDelegate, ADBannerViewDelegate {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var metricBtn: UIButton!
    @IBOutlet weak var imperialBtn: UIButton!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    
    var metricMode = true
    
    var bannerView:ADBannerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.canDisplayBannerAds = true
        self.bannerView?.delegate = self
        self.bannerView?.hidden = true
        
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
        if heightInput.text != "" && weightInput.text != ""{
            modeMetric = metricMode
            height = heightInput.text
            weight = weightInput.text
            performSegueWithIdentifier("showResult", sender: self)
        
        }
        else{
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "You have to type your weight and height"
            alert.addButtonWithTitle("Okay")
            alert.show()
        }
       }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.bannerView?.hidden = false
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
    return willLeave
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.bannerView?.hidden = true
    }

}