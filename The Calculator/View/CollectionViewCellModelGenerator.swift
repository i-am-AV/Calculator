//
//  CollectionViewCellModelGenerator.swift
//  The Calculator
//
//  Created by  Alexander on 30.11.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

extension Array where Element == CollectionViewCellModel {
    static func generate() -> [CollectionViewCellModel] {
        
        return [CollectionViewCellModel(titleText: "AC",
                                        backgroundColor: .darkGray /*tag:*/ ),
                CollectionViewCellModel(titleText: "+/-",
                                        backgroundColor: .darkGray),
                CollectionViewCellModel(titleText: "%",
                                        backgroundColor: .darkGray),
                CollectionViewCellModel(titleText: "/",
                                        backgroundColor: .orange),
                CollectionViewCellModel(titleText: "7",
                                        backgroundColor: .black),
                CollectionViewCellModel(titleText: "8",
                                        backgroundColor: .black),
                CollectionViewCellModel(titleText: "9",
                                        backgroundColor: .black),
                CollectionViewCellModel(titleText: "*",
                                        backgroundColor: .orange),
                CollectionViewCellModel(titleText: "4",
                                        backgroundColor: .darkGray),
                CollectionViewCellModel(titleText: "5",
                                        backgroundColor: .darkGray),
                CollectionViewCellModel(titleText: "6",
                                        backgroundColor: .darkGray),
                CollectionViewCellModel(titleText: "-",
                                        backgroundColor: .orange),
                CollectionViewCellModel(titleText: "1",
                                        backgroundColor: .darkGray),
                CollectionViewCellModel(titleText: "2",
                                        backgroundColor: .darkGray),
                CollectionViewCellModel(titleText: "3",
                                        backgroundColor: .darkGray),
                CollectionViewCellModel(titleText: "+",
                                        backgroundColor: .orange),
                CollectionViewCellModel(titleText: "0",
                                        backgroundColor: .darkGray),
                CollectionViewCellModel(titleText: ",",
                                        backgroundColor: .darkGray),
                CollectionViewCellModel(titleText: "=",
                                        backgroundColor: .orange)
        ]
    }
    
    //    static нельзя override при наследовании
    //    var let живет в секции статических инструкций всю "жизнь" приложения
}
