//
//  CalculatorModelImpl.swift
//  The Calculator
//
//  Created by  Alexander on 28.11.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

class CalculatorModelImpl: CalculatorModel {
    
    let operand = Operand()
    let stack = Stacks()
    let math = Math()
    var result = 0.0
    
    var output: CalculatorModelOutput!
    var state: InternalState = .initial
    var prevState: InternalState = .initial
    var lastSign: Operation = .percent
    var pointPressed = false
    var counter = 1.0
    
    func input(operation: Operation) {
        let internalState = newInternalState(operation)
        processWith(state: internalState)
        print("Нынешнее", internalState)
        print("Предыдущее", prevState)
        print("Первый", operand.first)
        print("Второй", operand.second)
        print("Первый изменился", operand.firstChanged)
        print("Второй изменился", operand.secondChanged)
        print("Нажата точка", pointPressed)
        stack.ofSigns.show()
        stack.ofNumbers.show()
        print("__________________________")
        print(counter)
    }
}

