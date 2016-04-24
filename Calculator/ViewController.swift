//
//  ViewController.swift
//  Calculator
//
//  Created by user on 23.04.16.
//  Copyright © 2016 atrusov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLable: UILabel!
    
    var stillTyping = false
    var firstOperand: Double = 0
    
    var currentInput: Double {
        get {
            return Double(displayResultLable.text!)!
        }
        set {
            displayResultLable.text = "\(newValue)"
            stillTyping = false
        }
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        let number = sender.currentTitle!
        
        
        if stillTyping {
            if displayResultLable.text?.characters.count < 20 {
                displayResultLable.text = displayResultLable.text! + number
            }
        } else {
            displayResultLable.text = number;
            stillTyping = true
        }
        
        
    }

    @IBAction func twoOperandsSignPressed(sender: UIButton) {
        firstOperand = currentInput
        print(firstOperand)
        stillTyping = false
    }
}

