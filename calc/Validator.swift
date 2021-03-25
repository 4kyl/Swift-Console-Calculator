//
//  Validator.swift
//  calc
//
//  Created by Ka Yuen Li on 3/16/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

func isValidInput(args: [String]) -> Bool {
    if (args.count == 1 && isValidOperator(str: args[0])) {
        print("Invalid expression")
        exit(1)
    }
    
    // The input expression is valid only if the number of element is an odd number
    if (args.count % 2 == 0) {
        print("Invalid expression")
        exit(1)
    }
    
    for elem in args {
        // Check if all elements are valid number or operators
        if (!isValidOperator(str: elem) && !isNumeric(str: elem)) {
            print("Invalid character was found in the expression")
            exit(1)
        }
    }
    
    return true;
}


// check if a string is a valid operator of '+,-,*,/,%'
func isValidOperator(str: String) -> Bool {
    return str.range(of: #"^(\+|-|x|\/|%)$"#, options: .regularExpression, range: nil, locale: nil) != nil
}

// check if a string is an integer
func isNumeric(str: String) -> Bool {
    return Int(str) != nil
}

// check if the result is out of bounds
func isOutOfBounds(num: Int) -> Bool {
    return num < Int32.min && num > Int32.max
}
