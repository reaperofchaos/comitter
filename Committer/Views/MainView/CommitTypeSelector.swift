//
//  CommitTypeSelector.swift
//  Committer
//
//  Created by Jacob Conner on 7/7/23.
//

import Foundation
import SwiftUI


struct CommitTypeSelector: View {
    @Binding var selectedCommitType: String
    let commitTypes = ["", "feat", "fix", "wip"]
    
    var body: some View {
        HStack{
            Form{
                Section{
                    Picker("Commit Type", selection: $selectedCommitType){
                        ForEach(commitTypes, id: \.self){
                            Text($0)
                        }
                    }.bold()
                }
            }.navigationTitle("Commit Type")
        }
    }
   
}
