//
//  ViewController.swift
//  The Calculator
//
//  Created by  Alexander on 28.11.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet var displayButtons: [UIButton]!
    var model: CalculatorModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewController 1 = \(self)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController 2 = \(self)")
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let tag = sender.tag
        
        switch tag {
        case 1...9:
            model.input(operation: .digit(Double(tag)))
        case 10:
            model.input(operation: .digit(0))
        case 11:
            model.input(operation: .clean)
        case 12:
            model.input(operation: .changeSigh)
        case 13:
            model.input(operation: .percent)
        case 14:
            model.input(operation: .div)
        case 15:
            model.input(operation: .mul)
        case 16:
            model.input(operation: .minus)
        case 17:
            model.input(operation: .plus)
        case 18:
            model.input(operation: .result)
        case 19:
            model.input(operation: .point)
        default: break
        }
    }
}

extension ViewController: CalculatorModelOutput {
    func display(string: String) {
        displayLabel.text = string
    }
}
