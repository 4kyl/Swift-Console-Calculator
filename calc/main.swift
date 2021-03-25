//
//  main.swift
//  calc
//
//  Created by Ka Yuen Li on 3/16/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

let calculator = Calculator();
let result = calculator.calculate(args: args)

print(result)
