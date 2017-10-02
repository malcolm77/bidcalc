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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func CalculateBid(_ sender: UIButton) {
        // button was pressed
        
        if Float(fullPriceField.text!) != nil { }
        if Float(percentToPayField.text!) != nil { }
        if Float(costOfPostageField.text!) != nil { }
        
        maxpay = fullprice + postage / (percentpay/100)
        
        bidAmountField.text = String(maxpay)
    }
    
}

