//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Wonsug E on 3/18/19.
//  Copyright © 2019 Wonsug E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldBill: UITextField!
    @IBOutlet weak var labelTipPercent: UILabel!
    @IBOutlet weak var sliderTip: UISlider!
    @IBOutlet weak var labelBill: UILabel!
    @IBOutlet weak var textFieldTip: UITextField!
    
    var bill = 0.0, tipPercent = 15.0, tip = 0.0, totalBill = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldBill.addTarget(self, action: #selector(compute(_:)), for: .editingChanged)
    
        textFieldTip.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        labelTipPercent.text = "Tip Percent: " + String(format: "%.0f", tipPercent) + "%"
    }

    @IBAction func compute(_ sender: Any) {
        let s = textFieldBill.text! //
        
        if ( s != "" ) {
            bill = Double(s) ?? 0
        }
        
        tip = bill * ( tipPercent / 100 )
        totalBill = bill + tip
        
        labelTipPercent.text = "Tip Percent: " + String(format: "%.0f", tipPercent) + "%"
        textFieldTip.text = String(format: "%.2f", tip)
        labelBill.text = "Total: $" + String(format: "%.2f", totalBill)
        

    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        tipPercent = Double(sliderTip.value * 50)
        
        let rem = tipPercent.truncatingRemainder(dividingBy: 1)
        if ( rem != 0 ) {
            tipPercent = tipPercent - rem
        }
        compute(sliderTip)
    }
    
    @IBAction func textFieldDidChange(_ sender: Any) {
        let r = textFieldTip.text! //
        
        if ( r != "" ) {
            tip = Double(r) ?? 0
        }
        
        tipPercent = tip * 100 / bill
        
        totalBill = bill + tip
        
        labelTipPercent.text = "Tip Percent: " + String(format: "%.0f", tipPercent) + "%"
        labelBill.text = "Total: $" + String(format: "%.2f", totalBill)
    }
    
    
    
}
