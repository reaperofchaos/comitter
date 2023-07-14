//
//  Title.swift
//  Committer
//
//  Created by Jacob Conner on 7/7/23.
//

import Foundation
import SwiftUI

struct CreateButtonComponent: View {
    var commitType: String
    var userStory: String
    var feat: String
    var message: String
    @Binding var commit: String
    var projectFolder: URL
    @Binding var output: String

    
    var body: some View {
        Button("Create Commit File"){
            
            commit = "\(commitType)(\(feat)): \(userStory) - \(message)"
            output = ""
            let contents = generateFileContents(commitType: commitType, feat: feat, us: userStory, message: message)
            writeFile(fileName: "commit.txt", directory: projectFolder, contents: contents)
        }
    }
}
