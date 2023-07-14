//
//  CommitTypeSelector.swift
//  Committer
//
//  Created by Jacob Conner on 7/7/23.
//

import Foundation
import SwiftUI


struct UserStorySelector: View {
    @State var feat: String;
    @Binding var selectedUserStory: String;
    let commitTypes = ["", "US12345", "US246810", "US369101"]
    
    var body: some View {
        Section{
            Picker("Pick a User Story", selection: $selectedUserStory){
                ForEach(commitTypes, id: \.self){
                    Text($0)
                }
            }.bold()
            Text("Feat: \(feat)")
        }
    }
}

