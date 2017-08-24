//
//  Loggage.swift
//  Loggage
//
//  Created by Thomas Kalhøj Clemensen on 24/08/2017.
//  Copyright © 2017 ThomasCle. All rights reserved.
//

import Foundation

public class Loggage: NSObject {
    
    /// Filters the handled log messages. The value of this property defines the minimum level of log messages that should be handled.
    /// 
    /// Default value is `.verbose`
    public static var minimumLogLevel: LogLevel = .verbose
    
    /// Controls whether the system uses emojis or not.
    ///
    /// Default value is `true`.
    ///
    /// **Note:** Developers who disable this are usually grumpy old men 💩
    public static var areEmojisEnabled: Bool = true
    
    /// Controls whether file, function and line are printed with the log messages
    ///
    /// Default value is `false`.
    public static var isDebugInformationEnabled: Bool = false
    
    /// Control whether the system should create an empty linebreak before all log messages.
    /// 
    /// Default value is `true`
    public static var isLineBreakEnabled: Bool = true
    
    /// Logs a verbose message.
    public static func verbose(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        Loggage.log(message: message, logLevel: .verbose, file: file, function: function, line: line)
    }

    /// Logs a debug message.
    public static func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        Loggage.log(message: message, logLevel: .debug, file: file, function: function, line: line)
    }
    
    /// Logs an info message.
    public static func info(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        Loggage.log(message: message, logLevel: .info, file: file, function: function, line: line)
    }
    
    /// Logs a warning message.
    public static func warning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        Loggage.log(message: message, logLevel: .warning, file: file, function: function, line: line)
    }
    
    /// Logs an error message.
    public static func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        Loggage.log(message: message, logLevel: .error, file: file, function: function, line: line)
    }
    
    
    
    
    //MARK: - Not public
    static func constructConsoleString(message: String, logLevel: LogLevel, file: String, function: String, line: Int) -> String {
        let tag: String = Loggage.areEmojisEnabled ? logLevel.emoji() : logLevel.name().uppercased()
        let fileName: String = file.components(separatedBy: "/").last ?? "UNKNOWN_FILE"
        let debugInfo: String = Loggage.isDebugInformationEnabled ? " \(fileName):\(line) - \(function)" : ""
        let lineBreak: String = Loggage.isLineBreakEnabled ? "\n" : ""
        return "\(lineBreak)\(tag)\(debugInfo): \(message)"
    }
    
    private static func log( message: String, logLevel: LogLevel, file: String, function: String, line: Int) {
        if logLevel.rawValue >= self.minimumLogLevel.rawValue {
            let consoleMessage: String = self.constructConsoleString(message: message, logLevel: logLevel, file: file, function: function, line: line)
            Loggage.printToConsole(consoleMessage)
        }
    }
    
    private static func printToConsole(_ message: String) {
        print(message)
    }
}
