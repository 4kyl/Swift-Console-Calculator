import Foundation

class Calculator {
    var currentResult = 0;

    func calculate(args: [String]) -> String {
        var stack: [Int] = []
        var op = "+"
        for elem in args {
            print(elem)
            if (isValidOperator(str: elem)) {
                op = elem
            } else if (isNumeric(str: elem)) {
                switch (op) {
                case "+":
                    stack.append(Int(elem)!)
                case "-":
                    stack.append(Int("-" + elem)!)
                case "*":
                    let result = stack.last! * Int(elem)!
                    stack.removeLast()
                    stack.append(result)
                case "\\":
                    stack.append(Int("-" + elem)!)
                default:
                    // TODO: Fix error message
                    stack.append(0)
                }
                
            }
        }
        
        
        print(args)
        // calculate the totoal of all numbers in the stack
        let total: Int = stack.reduce(0, +)
        return(String(total))
    }
    
    // check if a string is a valid operator of '+,-,*,/,%'
    private func isValidOperator(str: String) -> Bool {
        return str.range(of: #"^(\+|-|\*|\/|%)$"#, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    // check if a string is an integer
    private func isNumeric(str: String) -> Bool {
        return Int(str) != nil
        //return !str.isEmpty && str.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

enum ValidationError: Error {
    case InvalidInput
}

