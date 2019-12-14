//
//  Enums.swift
//  The Calculator
//
//  Created by  Alexander on 03.12.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

enum Operation: Equatable {
    case digit(Double)
    case clean
    case changeSigh
    case percent
    case div
    case mul
    case minus
    case plus
    case result
    case point
}

enum InternalState {
    case initial
    case input(Double)
    case mathOperation(Operation)
    case result
    case clean
}
