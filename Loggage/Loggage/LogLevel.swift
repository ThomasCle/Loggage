//
//  LogLevel.swift
//  Loggage
//
//  Created by Thomas Kalhøj Clemensen on 24/08/2017.
//  Copyright © 2017 ThomasCle. All rights reserved.
//

import Foundation


public enum LogLevel: Int {
    case verbose
    case debug
    case info
    case warning
    case error
    
    func name() -> String {
        let name: String
        
        switch self {
        case .verbose:
            name = "Verbose"
        case .debug:
            name = "Debug"
        case .info:
            name = "Info"
        case .warning:
            name = "Warning"
        case .error:
            name = "Error"
        }
        
        return name
    }
    
    func emoji() -> String {
        let emoji: String
        
        switch self {
        case .verbose:
            emoji = "🔊"
        case .debug:
            emoji = "🐞"
        case .info:
            emoji = "ℹ️"
        case .warning:
            emoji = "⚠️"
        case .error:
            emoji = "‼️"
        }
        
        return emoji
    }

}
