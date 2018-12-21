//
//  Shell.swift
//  PodspecUtilsCore
//
//  Created by Francesco Bigagnoli on 21/12/2018.
//

import Foundation

enum ShellError: Error {
    case standard(String)
}

final class Shell {
    private let path: String
    
    init(path: String = "/bin/sh") {
        self.path = path
    }
    
    public func execute(_ command: String, in cmdPath: String = ".") throws -> String {
        let task = Process()
        let cmd = "cd \(cmdPath);\(command)"
        task.arguments = ["-c", cmd]
        task.launchPath = path
        
        let outPipe = Pipe()
        let errPipe = Pipe()
        task.standardOutput = outPipe
        task.standardError = errPipe
        
        task.launch()
        
        let errData = errPipe.fileHandleForReading.readDataToEndOfFile()
        guard errData.isEmpty else {
            let errorString = String(data: errData, encoding: .utf8)!
            let error = ShellError.standard("⚠️ " + errorString)
            throw error
        }
        
        let outData = outPipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: outData, encoding: .utf8)!
        
        return output
    }
}
