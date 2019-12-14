//
//  The_CalculatorTests.swift
//  The CalculatorTests
//
//  Created by  Alexander on 28.11.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import XCTest
@testable import The_Calculator

class MockOutput: CalculatorModelOutput {
    var testOuput = ""
    func display(string: String) {
        testOuput = string
    }
}

class The_CalculatorTests: XCTestCase {
    private var calcModel: CalculatorModel!

    override func setUp() {
        calcModel = CalculatorModelImpl()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        calcModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOutput() {
        //given
        let output = MockOutput()
        calcModel.output = output
        //when
        calcModel.input(operation: .digit(1))
        calcModel.input(operation: .digit(2))
        calcModel.input(operation: .digit(3))
        calcModel.input(operation: .digit(4))
        calcModel.input(operation: .digit(5))
        calcModel.input(operation: .point)
        calcModel.input(operation: .digit(6))
        calcModel.input(operation: .digit(7))
        calcModel.input(operation: .digit(8))
        calcModel.input(operation: .digit(9))
        //then
        XCTAssert(output.testOuput != "12345,6789", "Ошибка ввода")
    }
    
    func testCalc() {
        //given
        let output = MockOutput()
        calcModel.output = output
        //when
        calcModel.input(operation: .digit(2))
        calcModel.input(operation: .plus)
        calcModel.input(operation: .digit(2))
        calcModel.input(operation: .mul)
        calcModel.input(operation: .digit(2))
        //then
        XCTAssert(output.testOuput != "6", "Ошибка приоритета")
    }
}
