//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber: Bool = true
    //    private variables are only accessible to the parent class,i.e. the ViewController in this file.
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    private var calculator = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        //        guard let number = Double(displayLabel.text!) else {
        //            fatalError("Cannot convert display label text to a Double.")
        //        }
        if let calcMethod = sender.currentTitle{
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
        }
        
        
    }



@IBAction func numButtonPressed(_ sender: UIButton) {
    
    //What should happen when a number is entered into the keypad
    
    if let numValue = sender.currentTitle {
        if isFinishedTypingNumber {
            displayLabel.text = numValue
            isFinishedTypingNumber = false
        }
        else
        {
            
            if numValue == "." {
                
                //                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                //                        fatalError("Cannot convert display label text to a Double!")
                //                    }
                
                let isInt = floor(displayValue) == displayValue
                
                if !isInt {
                    return
                }
            }
            displayLabel.text = displayLabel.text! + numValue
        }
    }
    
}

}

//click command+option+<- below first line to collapse again and command+option+-> inside curly braces to open again(you can double click on ... also)


