//
//  AppDelegate.swift
//  The Calculator
//
//  Created by  Alexander on 28.11.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let assembly = CalculatorAssembly()
        let model = assembly.model
        let viewController = assembly.calculatorViewController(with: model)
        window = UIWindow()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

