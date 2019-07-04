//
//  DogYearsUnitTests.swift
//  DogYearsUnitTests
//
//  Created by Elias Gabriel dos Santos Correa on 03/07/19.
//  Copyright © 2019 Razeware. All rights reserved.
//

import XCTest
@testable import DogYears // Importa o código do projeto
// O testable nos permite acesso a métodos e elementos como acesso interno

class DogYearsUnitTests: XCTestCase {
    
    // Somente métodos começando com a palavra Test vão ser executados sem uma ordem específica
    
    let calc = Calculator()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAdd(){
        let result = calc.evaluate(op: "+", arg1: 2.0, arg2: 9.0)
        XCTAssert(result == 11.0, "Calculator add operation failed") // Checa se as se as condições do primeiro parâmetro são verdadeiras
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
