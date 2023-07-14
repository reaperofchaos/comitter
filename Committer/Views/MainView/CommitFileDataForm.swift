//
//  CommitFileDataForm.swift
//  Committer
//
//  Created by Jacob Conner on 7/8/23.
//

import Foundation
import SwiftUI

struct CommitFileDataForm: View {
    @Binding var userStory: String
    @State var feat: String
    @State var selectedFolder: URL
    @State var selectedCommitType = ""
    @State var message: String = ""
    @State var commit = ""
    @State var commandOutput =  ""
    
    
    var body: some View {
        VStack{
            HStack{
                CommitTypeSelector(selectedCommitType: $selectedCommitType);
                Spacer().frame(width: 600)
            }.padding(.bottom, 20)
            UserStorySelector( feat: feat, selectedUserStory: $userStory).padding(.bottom, 20);
            CommitMessageTextField(message: $message).padding(.bottom, 20);
            MessagePreviewComponent(commit: $commit);
            HStack{
                CreateButtonComponent(
                    commitType: selectedCommitType,
                    userStory: userStory,
                    feat: feat,
                    message: message,
                    commit:$commit,
                    projectFolder: selectedFolder,
                    output: $commandOutput);
                CommitButton(
                    commit: commit,
                    output: $commandOutput)
            }.padding(.bottom, 20);
            OutputMessage(output: commandOutput)
        }
    }
}
