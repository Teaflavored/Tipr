//
//  SettingsViewController.swift
//  Tipr
//
//  Created by Auster Chen on 8/20/17.
//  Copyright © 2017 Auster Chen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults = UserDefaults.standard
    let defaultTipPercentageIndexKey = "default_tip_percentage_index"

    @IBOutlet weak var defaultTipPercentageControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let existingIndex = getExistingIndex()
        defaultTipPercentageControl.selectedSegmentIndex = existingIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onChange(_ sender: Any) {
        let selectedIndex =  defaultTipPercentageControl.selectedSegmentIndex
        defaults.set("\(selectedIndex)", forKey: defaultTipPercentageIndexKey)
        defaults.synchronize()
    }
    
    func getExistingIndex() -> Int {
        let existingIndex = defaults.string(forKey: defaultTipPercentageIndexKey)

        if (existingIndex != nil) {
            return Int(existingIndex!)!
        }

        return 1
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
