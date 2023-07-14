//
//  Title.swift
//  Committer
//
//  Created by Jacob Conner on 7/7/23.
//

import Foundation
import SwiftUI

struct CommitButton: View {
    var commit: String
    @State var isRunning = false
    @Binding var output: String
    
    var body: some View {
        Button("Commit", action: {
            print("commit message \(commit)")
            do {
                let result = try safeShell("git commit -m \"\(commit)\"")
                output = result
                print(result);
            }
            catch {
                print("\(error)") //handle or silence the error here
            }
        })
    }
}
