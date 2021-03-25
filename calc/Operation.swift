//
//  Operation.swift
//  calc
//
//  Created by Ka Yuen Li on 3/16/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

func multiply (num1: Int, num2: Int) -> Int {
    return num1 * num2;
}

func divide (num1: Int, by num2: Int) -> Int {
    guard num2 != 0 else {
        print ("Division by zero")
        exit(1)
    }
    return num1 / num2
}

func mod (num1: Int, by num2: Int) -> Int {
    guard num2 != 0 else {
        print ("Division by zero")
        exit(1)
    }
    return num1 % num2
}
