//
//  Operands.swift
//  The Calculator
//
//  Created by  Alexander on 05.12.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

class Operand {
    
    var first = 0.0
    var second = 0.0
    var firstChanged = false
    var secondChanged = false
    
    func cleanFirst() {
        first = 0
        firstChanged = false
    }
    
    func cleanSecond() {
        second = 0
        secondChanged = false
    }
    
    func cleanAll() {
        first = 0
        second = 0
        firstChanged = false
        secondChanged = false
    }
}
