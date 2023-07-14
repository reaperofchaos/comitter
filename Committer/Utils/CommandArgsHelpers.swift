//
//  CommandArgsHelpers.swift
//  Committer
//
//  Created by Jacob Conner on 7/8/23.
//

import Foundation

/**
 Retrieves the current path from the FileManager object
 */
func getWorkingDirectory()->URL{
    let path = FileManager.default.currentDirectoryPath;
    return URL(fileURLWithPath: path)
}

/**
 Retrieves the current path from thef first argument in the terminal that calls this
 program. This is a subdirectory inside of the app file
 */
func getWorkingDirectoryFromArgs()->URL{
    let path = (CommandLine.arguments[0])
    print("path: \(path)")
    let pathUrl =  URL(string: path)
    let updatedPath = pathUrl?.deletingLastPathComponent()
    
    _ = FileManager.default.currentDirectoryPath;
    let folder = URL(fileURLWithPath: path)

    guard let workingDir =  updatedPath else { return folder }
   
    return workingDir
}


/**
 Retrieves the current path from the unix PWD command
 */
func getWorkingDirectoryFromUnix()->URL{
    let output: String;
    let osWorkingDir = FileManager.default.currentDirectoryPath;
    print("FileManager CurrentDirectoryPath: \(osWorkingDir)");

    let folder = URL(fileURLWithPath: osWorkingDir)
    do {
        let result = try safeShell("pwd")
        output = result
        print("PWD: \(result)");
        let pathUrl =  URL(string: output)

        guard let workingDir =  pathUrl else { return folder }
        
        return workingDir;
    }
    catch {
        print("\(error)") //handle or silence the error here
    }
    
    return folder;
}
