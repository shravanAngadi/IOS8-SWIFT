//
//  ViewController.swift
//  CalculatorIOS
//
//  Created by Airatch on 30/10/15.
//  Copyright (c) 2015 AirWatch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userInTheMiddleOfTypingNumber: Bool = false
    
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        print("Digit : \(digit)")
        
        if userInTheMiddleOfTypingNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userInTheMiddleOfTypingNumber = true
        }
        
    }
    
    @IBAction func enter() {
        userInTheMiddleOfTypingNumber = false
        operandStack.append(displayValue)
        print("Operand Stack : \(operandStack)")
    }
    
    var operandStack = Array<Double>()
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            print("Inside displayValue setter. New value entered : \(newValue)")
            display.text = "\(newValue)"
            userInTheMiddleOfTypingNumber=false
        }
    }
    
    //Gesture recognition. Expt.
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    
    @IBAction func displayGestureForTapRecognizer(sender: AnyObject) {
    }
    //not needed right now.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

