//
//  ViewController.swift
//  Tip It
//
//  Created by Cole McLemore on 12/12/15.
//  Copyright © 2015 Cole McLemore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipSlider: UISlider!
    
    @IBOutlet weak var sliderTextLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalTextLabel: UILabel!
    
    @IBOutlet weak var tipTextLabel: UILabel!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        [billField .becomeFirstResponder()]
        
        transition()
        
        let DefaultTipSetting = defaults.integerForKey("defaultTipSize")
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        tipControl.selectedSegmentIndex = DefaultTipSetting
        
        if defaults.boolForKey("customTip") == true {
            
            tipControl.hidden = true
            tipSlider.hidden = false
            sliderTextLabel.hidden = false
            
        } else {
            
            tipControl.hidden = false
            tipSlider.hidden = true
            sliderTextLabel.hidden = true
            
        }
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        [billField .becomeFirstResponder()]
        
        transition()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let DefaultTipSetting = defaults.integerForKey("defaultTipSize")
        
        tipControl.selectedSegmentIndex = DefaultTipSetting
        
        if defaults.boolForKey("customTip") == true {
            
            tipControl.hidden = true
            tipSlider.hidden = false
            sliderTextLabel.hidden = false
            
        } else {
            
            tipControl.hidden = false
            tipSlider.hidden = true
            sliderTextLabel.hidden = true
            
        }
        
        updateValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
    
        updateValues()
        transition()
    }
    
    
    @IBAction func sliderValueChange(sender: UISlider) {
        
        sliderTextLabel.text = "Tip: " + String(format: "%.0f", tipSlider.value*100) + "%"
         updateValues()
        
    }
    
    
    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)

    }
    
    func updateValues() {
        
        var tipPercentages = [0.18, 0.2, 0.25]
        var tipPercentage = Double(0)
        
        if defaults.boolForKey("customTip") == true {
            
            tipPercentage = Double(round((tipSlider.value*100))/100)
            
        } else {
            
            tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            
        }
        
        
        var billAmount = billField.text!._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

        
    }
    
    func transition() {
        
        if billField.text == "" {
            
            UIView.animateWithDuration(0.3, animations: {
                

            self.billField.center.y = 210
            self.tipLabel.alpha = 0
            self.totalLabel.alpha = 0
            self.sliderTextLabel.alpha = 0
            self.tipSlider.alpha = 0
            self.tipControl.alpha = 0
            self.totalTextLabel.alpha = 0
            self.tipTextLabel.alpha = 0
            })
            
        } else {
            
            UIView.animateWithDuration(0.5, animations: {
            self.billField.center.y = 96
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
            self.sliderTextLabel.alpha = 1
            self.tipSlider.alpha = 1
            self.tipControl.alpha = 1
            self.totalTextLabel.alpha = 1
            self.tipTextLabel.alpha = 1
            
            })
        }
        
    }
    
}


