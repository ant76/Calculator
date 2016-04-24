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
    var secondOperand:Double = 0
    var operationSign: String = ""
    var dotIsPleced = false
    
    var currentInput: Double {
        get {
            return Double(displayResultLable.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.componentsSeparatedByString(".")
            
            if valueArray[1] == "0" {
                displayResultLable.text = "\(valueArray[0])"
            } else {
                displayResultLable.text = value
            }
            
            stillTyping = false
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
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
        operationSign = sender.currentTitle!
        firstOperand = currentInput

        stillTyping = false
    }
    
    func operateWithTwoOperands(operation:(Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
        dotIsPleced = false
    }
    
    @IBAction func clearButtonPressed(sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLable.text = "0"
        stillTyping = false
        operationSign = ""
        dotIsPleced = false
    }
    
    
    @IBAction func plusMinusButtonPressed(sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func persentageButtonPressed(sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            currentInput = firstOperand * currentInput / 100
        }
        
        
        currentInput = sqrt(currentInput)
    }
    
    @IBAction func squareRootButtonPressed(sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
    
    @IBAction func dotButtonPressed(sender: UIButton) {
        if stillTyping && !dotIsPleced {
            displayResultLable.text = displayResultLable.text! + "."
            dotIsPleced = true
        } else if !stillTyping && !dotIsPleced {
            displayResultLable.text = "0."
        }
        
    }
    
    
    @IBAction func equalitySignPressed(sender: UIButton) {
        if stillTyping {
             secondOperand = currentInput
        }
        
        dotIsPleced = false
        
        switch operationSign {
        case "+":
            operateWithTwoOperands{$0 + $1}
        case "-":
            operateWithTwoOperands{$0 - $1}
        case "×":
            operateWithTwoOperands{$0 * $1}
        case "÷":
            operateWithTwoOperands{$0 / $1}
            
        default: break
        
        }
    }
}

