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
    
    var resData: Data? = nil
    
    // Somente métodos começando com a palavra Test vão ser executados sem uma ordem específica
    
    let calc = Calculator()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMenuFailing(){
        var menu = Menu()
        menu.loadMenu(path: "Dummy.plist")
        let count = menu.count
        XCTAssert(count == 0, "Menu loaded menu items for non-existent menu file")
    }
    
    
    func testSubtract(){
        let result = calc.evaluate(op: "-", arg1: 5.0, arg2: 2.0)
        XCTAssert(result == 3.0, "Calculator subtract operation failed")
    }
    
    func testAdd(){
        let result = calc.evaluate(op: "+", arg1: 2.0, arg2: 9.0)
        XCTAssert(result == 11.0, "Calculator add operation failed") // Checa se as se as condições do primeiro parâmetro são verdadeiras
    }
    
    func testResult(){

    }

    func testClear(){
        calc.clear()
        let result = calc.result
        XCTAssert(result == 0.0, "Calculator clear operation failed")
    }
    
    func testInfoLoading() {
        let url = "https://raw.githubusercontent.com/FahimF/Test/master/DogYears-Info.rtf"
        
        let session = MockSession()
        let client = HTTPClient(session: session)
        
        
        client.get(url: url) {
            (data, error) in
            self.resData = data
        }
        let pred = NSPredicate(format: "resData != nil")
        let exp = expectation(for: pred, evaluatedWith: self, handler: nil)
        let res = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if res == XCTWaiter.Result.completed {
            XCTAssertNotNil(resData, "No data recived from the server for InfoView content")
        } else {
            XCTAssert(false, "The call to get the URL ran into some other error")
        }
        
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
