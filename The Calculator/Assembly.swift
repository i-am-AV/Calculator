//
//  Assembly.swift
//  The Calculator
//
//  Created by  Alexander on 28.11.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import UIKit

class CalculatorAssembly {
    var model: CalculatorModelImpl {
        return CalculatorModelImpl()
    }
    
    func calculatorViewController(with model: CalculatorModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "calc") as! ViewController
        
        print("calculatorViewController = \(viewController)")
        viewController.model = model
        model.output = viewController
        
        return viewController
    }
    
    func calculatorCollectionViewController(with model: CalculatorModel) -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "calc2") as! SecondViewController
        
        print("calculatorViewController = \(viewController)")
        viewController.model = model
        model.output = viewController
        
        return viewController
    }
}
