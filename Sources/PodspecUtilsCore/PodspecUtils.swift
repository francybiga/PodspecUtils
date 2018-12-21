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
        
//        let repo = GitRepo(path: )
        let shell = Shell()
        
        do {
            print(try shell.execute("pwd", in: "~"))
        } catch ShellError.standard(let msg) {
            print(msg)
        }
        
        utilsCli.goAndExit()                
    }
}

struct GitRepo {
    private let repoPath: String
    private let shell = Shell()
    
    init(path: String) {
        self.repoPath = path
    }
    
    private func exec(command: String) throws -> String {
        return try shell.execute(command, in: repoPath)
    }
    
    func gitStatusClean() -> Bool {
        return try! exec(command: "git status --porcelain | wc -l").trimmingCharacters(in: .whitespacesAndNewlines) == "0"
    }
}
