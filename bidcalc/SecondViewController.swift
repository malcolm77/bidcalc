//
//  SecondViewController.swift
//  bidcalc
//
//  Created by Malcolm Chalmers on 12/6/17.
//  Copyright © 2017 Malcolm Chalmers. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{
    @IBOutlet weak var fullPriceField: UITextField!
    @IBOutlet weak var percentToPayField: UITextField!
    @IBOutlet weak var maxToPayField: UITextField!
    @IBOutlet weak var costOfPostageField: UITextField!
    @IBOutlet weak var bidAmountField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var fullprice: Float = 0.0
    var percentpay: Float = 0.0
    var maxpay: Float = 0.0
    var postage: Float = 0.0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        calculateButton.layer.cornerRadius = 5
        calculateButton.clipsToBounds = true
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func CalculateBid(_ sender: UIButton) {
        // button was pressed
        
        dismissKeyboard()
        
        if Float(fullPriceField.text!) != nil { fullprice = Float(fullPriceField.text!)! }
        if Float(percentToPayField.text!) != nil { percentpay = Float(percentToPayField.text!)! }
        if Float(costOfPostageField.text!) != nil { postage = Float(costOfPostageField.text!)! }
        
        maxpay = (fullprice + postage) * (percentpay/100)
        
        //print("max pay:\(maxpay), fullprice:\(fullprice), percentpay:\(percentpay), costofpostage:\(postage)")
        
        bidAmountField.text = String(maxpay)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

