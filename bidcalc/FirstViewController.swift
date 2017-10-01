//
//  FirstViewController.swift
//  bidcalc
//
//  Created by Malcolm Chalmers on 12/6/17.
//  Copyright © 2017 Malcolm Chalmers. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var maxToPay: UITextField!
    @IBOutlet weak var postageCost: UITextField!
    @IBOutlet weak var amountToBid: UITextField!
    
    var maxPay: Float = 0
    var postage: Float = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        maxToPay.delegate = self
        postageCost.delegate = self
        amountToBid.delegate = self
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateBid(_ sender: UIButton)
    {
        CalculateBid()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        // add dollar sign once editing is done
//        if let text = textField.text {
//         textField.text = "$" + text
//        }
//    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func CalculateBid () {
        // convert maxToPay string to maxPay float
//        if maxToPay.text != ""
//        {
//            maxPay = Float((maxToPay?.text!)!)!
//        }
        
        if let maxpay = Float(maxToPay.text!) {
            maxPay = maxpay
        } else {
            maxPay = 0.0
        }
        
        // convert postageCost string to postage float
        if postageCost.text != ""
        {
            // if let value = maxToPay?.text! {              maxPay = Int(value)!             }
            postage = Float((postageCost?.text!)!)!
        }
        
        
        // subtract postage from maxPay, convert to string and put in amountToBid
        
        if maxPay != 0 && postage != 0 {
            amountToBid.text = String(maxPay-postage) }
        else {
            amountToBid.text = "error"
        }
    }
}

