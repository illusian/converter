//
//  unitConverterTests.swift
//  unitConverterTests
//
//  Created by devOne on 30/01/19.
//  Copyright © 2019 yoozz. All rights reserved.
//

import XCTest
@testable import unitConverter

class unitConverterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testConverter() {
        let valueTest1 = convertClass.init(type: "t", inputVal: 100, inputUnit: "Celsius", outputUnit: "Fahrenheit")?.convert()
        XCTAssertEqual("212 degrees Fahrenheit", valueTest1)
        
        let valueTest2 = convertClass.init(type: "t", inputVal: 100, inputUnit: "Kelvin", outputUnit: "Fahrenheit")?.convert()
        XCTAssertEqual("-280 degrees Fahrenheit", valueTest2)
        
        let valueTest3 = convertClass.init(type: "v", inputVal: 11, inputUnit: "liters", outputUnit: "gallons")?.convert()
        XCTAssertEqual("3 gallons", valueTest3)
        
        let valueTest4 = convertClass.init(type: "v", inputVal: 11, inputUnit: "gallons", outputUnit: "milliliters")?.convert()
        XCTAssertEqual("41,640 milliliters", valueTest4)
    }

}
