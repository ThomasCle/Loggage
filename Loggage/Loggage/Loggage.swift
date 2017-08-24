//
//  Loggage.swift
//  Loggage
//
//  Created by Thomas Kalhøj Clemensen on 24/08/2017.
//  Copyright © 2017 ThomasCle. All rights reserved.
//

import Foundation

class Loggage: NSObject {
    
    static func log(_ message: String) {
        printToConsole(message)
    }
    
    private static func printToConsole(_ message: String) {
        print(message)
    }
}
