//
//  Extensions.swift
//  The Calculator
//
//  Created by  Alexander on 05.12.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

extension CalculatorModelImpl {
    func processWith(state: InternalState) {
        
        switch state {
        case .initial: break
        case .input(let value):
            //===========Предыдущее состояние===========
            switch prevState {
            case .result:
                stack.cleanAll()
                operand.cleanAll()
                pointPressed = false
                counter = 1
                result = 0
            default: break
            }
            
            
            switch pointPressed {
            case false:
                if !operand.firstChanged {
                    operand.first = operand.first * 10 + value
                    output.display(string: math.toIntIfPoss(operand.first))
                } else {
                    operand.second = operand.second * 10 + value
                    output.display(string: math.toIntIfPoss(operand.second))
                }
            case true:
                counter *= 0.1
                if !operand.firstChanged {
                    operand.firstChanged = false
                    operand.first = operand.first + value * counter
                    output.display(string: "\(operand.first)")
                } else {
                    operand.second = operand.second + value * counter
                    output.display(string: "\(operand.second)")
                }
            }
            
           
            
        case .mathOperation(let op):
            //===========Предыдущее состояние===========
            switch prevState {
            case .mathOperation(_):
                stack.ofSigns.pop()
                stack.ofNumbers.pop()
            default: break
            }
            
            guard op != .point else {
                pointPressed = true
                counter = 1
                return
            }
            
            guard op != .changeSigh,
                op != .percent,
                op != .clean
                else { return }
            
            pointPressed = false
            //===========Заполнение операндов===========
            
            if !operand.firstChanged {
                operand.firstChanged = true
                operand.secondChanged = false
                stack.ofNumbers.push(elem: operand.first)
                operand.first = 0
            } else if !operand.secondChanged {
                operand.firstChanged = false
                operand.secondChanged = true
                stack.ofNumbers.push(elem: operand.second)
                operand.second = 0
            }
            //===========Заполнение стеков===========
            switch op {
            case .div, .mul, .minus, .plus:
                print(op)
                print(stack.ofSigns.peek())
                if stack.ofSigns.isEmpty() {
                    stack.ofSigns.push(elem: op)
                    break
                } else {
                    let peek = stack.ofSigns.peek()
                    print(peek)
                    switch peek {
                    case .div, .mul:
                        while !stack.ofSigns.isEmpty() {
                            if !stack.ofNumbers.isEmpty() {
                                let second = stack.ofNumbers.pop()!
                                let first = stack.ofNumbers.pop() ?? second
                                let sign = stack.ofSigns.pop()!
                                result = math.calc(first: first,
                                                   second: second,
                                                   sign: sign)!
                                stack.ofNumbers.push(elem: result)
                                output.display(string: math.toIntIfPoss(result))
                            }
                        }
                        stack.ofSigns.push(elem: op)
                        
                    case .minus, .plus:
                        
                        switch op {
                        case .div, .mul:
                            stack.ofSigns.push(elem: op)
                        default:
                            while !stack.ofSigns.isEmpty() {
                                if !stack.ofNumbers.isEmpty() {
                                    let second = stack.ofNumbers.pop()!
                                    let first = stack.ofNumbers.pop() ?? second
                                    let sign = stack.ofSigns.pop()!
                                    result = math.calc(first: first,
                                                       second: second,
                                                       sign: sign)!
                                    stack.ofNumbers.push(elem: result)
                                    output.display(string: math.toIntIfPoss(result))
                                }
                            }
                            stack.ofSigns.push(elem: op)
                        }
                        
                    default: break
                    }
                }
            default: break
            }
            //===========Предыдущее состояние===========
            switch prevState {
            case .result:
                stack.ofNumbers.pop()
            default: break
            }
            
        case .clean:
            stack.cleanAll()
            operand.cleanAll()
            pointPressed = false
            counter = 1
            result = 0
            output!.display(string: "\(0)")
            
        case .result:
            
            if !operand.firstChanged && !operand.secondChanged {
                break
            }
            
            if !operand.firstChanged {
                operand.firstChanged = true
                operand.secondChanged = false
                stack.ofNumbers.push(elem: operand.first)
                operand.first = 0
            } else if !operand.secondChanged {
                operand.firstChanged = false
                operand.secondChanged = true
                stack.ofNumbers.push(elem: operand.second)
                operand.second = 0
            }
            
            operand.firstChanged = false
            operand.secondChanged = false
            pointPressed = false
            counter = 1
            
            if !stack.ofSigns.isEmpty() {
                while !stack.ofSigns.isEmpty() {
                    if !stack.ofNumbers.isEmpty() {
                        let second = stack.ofNumbers.pop()!
                        let first = stack.ofNumbers.pop() ?? second
                        let sign = stack.ofSigns.pop()!
                        result = math.calc(first: first,
                                           second: second,
                                           sign: sign)!
                        stack.ofNumbers.push(elem: result)
                        output.display(string: math.toIntIfPoss(result))
                    }
                }
            } 
        }
        prevState = state
    }
}

extension CalculatorModelImpl {
    func newInternalState(_ inputState: Operation) -> InternalState {
        switch inputState {
        case .digit(let value):
            return .input(value)
        case .div, .minus, .mul, .percent, .plus, .point, .changeSigh:
            return .mathOperation(inputState)
        case .result:
            return .result
        case .clean:
            return .clean
        }
    }
}
