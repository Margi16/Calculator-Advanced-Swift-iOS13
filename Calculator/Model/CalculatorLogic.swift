//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Margi Bhatt on 25/01/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?//tuple
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
            
            
//            if symbol == "+/-" {
                //                displayLabel.text = String(displayValue * -1)
//                return n * -1
//            }
//            else if symbol == "AC" {
//                //                displayLabel.text = String(0)//"0"
//                return 0
//            }
//            else if symbol == "%" {
//                //                displayLabel.text = String(displayValue / 100)//displayValue*0.01
//                return n * 0.01
//            }
//            else if symbol == "=" {
//                performTwoNumberCalculation(n2: n)
//            }
//            else {
//                intermediateCalculation = (n1: n, calcMethod: symbol)
//            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
    
}
