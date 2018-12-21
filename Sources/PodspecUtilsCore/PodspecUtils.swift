import Foundation
import SwiftCLI

public final class PodspecUtils {
    private let arguments: [String]
    
    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() throws {
        //CLI
        let utilsCli = CLI(name: "PodspecUtils", version: "0.0.1", description: "Automate interaction with Cocoapods' podspecs files.")
        
        let shell = Shell()
        do {
            print(try shell.execute("pwd", in: "~"))
        } catch ShellError.standard(let msg) {
            print(msg)
        }
        
        utilsCli.goAndExit()                
    }
}

//Git
extension PodspecUtils {
    func isRepoDirty() {
    
    }
}
