//
//  SettingsViewController.swift
//  Tip It
//
//  Created by Cole McLemore on 12/13/15.
//  Copyright © 2015 Cole McLemore. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSwitch: UISwitch!
    
    @IBOutlet weak var settingTipControl: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let DefaultTipSetting = defaults.integerForKey("defaultTipSize")
        
        settingTipControl.selectedSegmentIndex = DefaultTipSetting
        
        let customizedTips = defaults.boolForKey("customTip")
     
        tipSwitch.on = customizedTips
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func customTipSwitch(sender: UISwitch) {
        
        if tipSwitch.on {
            defaults.setBool(true, forKey: "customTip")
            defaults.synchronize()
        } else {
            defaults.setBool(false, forKey: "customTip")
            defaults.synchronize()
        }
        
    }
    
    @IBAction func settingTipChange(sender: AnyObject) {
        
        defaults.setInteger(settingTipControl.selectedSegmentIndex, forKey: "defaultTipSize")
        defaults.synchronize()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        defaults.setInteger(settingTipControl.selectedSegmentIndex, forKey: "defaultTipSize")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
