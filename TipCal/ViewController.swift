//
//  ViewController.swift
//  TipCal
//
//  Created by Grace To on 12/27/18.
//  Copyright © 2018 Grace To. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalOne: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalTwo: UILabel!
    @IBOutlet weak var totalThree: UILabel!
    @IBOutlet weak var totalFour: UILabel!
    @IBOutlet weak var totalFive: UILabel!
    @IBOutlet weak var totalSix: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "myInt")
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.15, 0.2, 0.25]
        let bill = (Double) (billField.text!) ?? 0
        tipControl.setEnabled(true, forSegmentAt: tipControl.selectedSegmentIndex)
        let num = tipPercentages[tipControl.selectedSegmentIndex]
        let tip = bill * num
        let total = bill + tip
        let two = total/2
        let three = total/3
        let four = total/4
        let five = total/5
        let six = total/6
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalOne.text = String(format: "$%.2f", total)
        totalTwo.text = String(format: "$%.2f", two)
        totalThree.text = String(format: "$%.2f", three)
        totalFour.text = String(format: "$%.2f", four)
        totalFive.text = String(format: "$%.2f", five)
        totalSix.text = String(format: "$%.2f", six)
    }
    
    
}

