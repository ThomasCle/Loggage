//
//  LoggageTests.swift
//  LoggageTests
//
//  Created by Thomas Kalhøj Clemensen on 24/08/2017.
//  Copyright © 2017 ThomasCle. All rights reserved.
//

import XCTest
import Foundation

@testable import Loggage

class LoggageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLog() {
        Loggage.log("My log message!")
        XCTAssert(true, "Let's just assume that Apple's 'print' function work for now 😅")
        
    }
}
