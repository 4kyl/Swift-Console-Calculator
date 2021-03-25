//
//  Calculator.swift
//  calc
//
//  Created by Ka Yuen Li on 3/16/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

class Calculator {
    func calculate(args: [String]) -> String {
        if(!isValidInput(args: args)) {
            exit(1)
        }
        
        var stack: [Int] = []
        var op: String = "+"
        for elem in args {
            if (isValidOperator(str: elem)) {
                op = elem
            } else if (isNumeric(str: elem)) {
                let currentNumber = Int(elem)!
                switch (op) {
                case "+":
                    stack.append(currentNumber)
                case "-":
                    stack.append(-currentNumber)
                case "x":
                    let result = multiply(num1: stack.last!, num2: currentNumber)
                    stack.removeLast()
                    stack.append(result)
                case "/":
                    let result = divide(num1: stack.last!, by: currentNumber)
                    stack.removeLast()
                    stack.append(result)
                case "%":
                    let result = mod(num1: stack.last!, by:currentNumber)
                    stack.removeLast()
                    stack.append(result)
                default:
                    break
                }
                
            }
        }
        
        // calculate the totoal of all numbers in the stack
        let total: Int = stack.reduce(0, +)
        
        if (isOutOfBounds(num: total)) {
            print("The result is out of bounds")
            exit(1)
        }
        
        return(String(total))
    }

}

