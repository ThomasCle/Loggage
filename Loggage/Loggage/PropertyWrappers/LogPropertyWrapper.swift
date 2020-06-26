//
//  LogPropertyWrapper.swift
//  Loggage
//
//  Created by Thomas Kalhøj Clemensen on 26/06/2020.
//  Copyright © 2020 ThomasCle. All rights reserved.
//

import Foundation

public struct LoggagePropertySetter : OptionSet {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    
    static public let willSet = LoggagePropertySetter(rawValue: 1 << 0)
    static public let didSet = LoggagePropertySetter(rawValue: 1 << 1)
}

@propertyWrapper
public struct LogSet<T> {
    public let options: LoggagePropertySetter
    public let logLevel: LogLevel
    public let propertyName: String
    
    public init(wrappedValue initalValue: T, _ name: String, options: LoggagePropertySetter = .willSet, logLevel: LogLevel = .verbose) {
        self.propertyName = name
        self.options = options
        self.logLevel = logLevel
        self.wrappedValue =  initalValue
    }
    
    public var wrappedValue: T {
        willSet {
            if (options.contains(.willSet)) {
                Loggage.log("Will set \(propertyName) = \(newValue) (current value is: \(wrappedValue))", for: logLevel)
            }
        }
        
        didSet {
            if (options.contains(.didSet)) {
                Loggage.log("Did set \(propertyName) = \(wrappedValue) (previous value was: \(oldValue))", for: logLevel)
            }
        }
    }
}
