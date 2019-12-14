//
//  Formatter.swift
//  The Calculator
//
//  Created by  Alexander on 03.12.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

class Math {
    func calc(first: Double, second: Double, sign: Operation) -> Double? {
        switch sign {
        case .div:
            return first / second
        case .mul:
            return first * second
        case .minus:
            return first - second
        case .plus:
            return first + second
        default:
            return nil
        }
    }
        
    func toIntIfPoss(_ number: Double) -> String {
        return number == number.rounded() ? "\(Int(number))" : "\(number)"
    }
}




