//
//  CalculatorAppTests.swift
//  CalculatorAppTests
//
//  Created by Anupam G on 06/07/22.
//

import XCTest
@testable import CalculatorApp


class CalculatorAppTests: XCTestCase {
    
    private var calculator : Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }

    func test_AddTwoNumbers(){
        let result = calculator.add(2, b: 3)
        XCTAssertEqual(result, 5)
    }
    
    func test_SubstractTwoNumbers(){
        let result = calculator.substract(9, b: 3)
        XCTAssertEqual(result, 6)
    }
    
    override class func tearDown() {
        super.tearDown()
    }

}
