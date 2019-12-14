//
//  CalculatorModel.swift
//  The Calculator
//
//  Created by  Alexander on 28.11.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

protocol CalculatorModel: class {
    var output: CalculatorModelOutput! { get set }
    func input(operation: Operation)
}

protocol CalculatorModelOutput {
    func display(string: String)
}
