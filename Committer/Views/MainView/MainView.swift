//
//  MainView.swift
//  Committer
//
//  Created by Jacob Conner on 7/7/23.
//
import Foundation
import SwiftUI


struct MainView: View {
    @Environment(\.managedObjectContext) var viewContext

    @FetchRequest(sortDescriptors: []) var directory: FetchedResults<DirectoryList>

    @State var commitFileData: CommitFileData? = nil
    @State var selectedCommitType = ""
    @State var selectedUserStory = ""
    @State var selectedFeat = ""

    @State var selectedFolder: URL = getWorkingDirectory()
    
    var body: some View {
        HStack{
            Spacer().frame(width: 50)
            VStack(alignment: .center){
                TitleComponent().padding(.bottom, 80);
                DirectorySelector(commitFileData: $commitFileData, selectedFolder: $selectedFolder, selectedUserStory: $selectedUserStory, selectedFeat: $selectedFeat)
                CommitFileDataForm(userStory: $selectedUserStory, feat:
                                    selectedFeat, selectedFolder: selectedFolder)
            }
            Spacer().frame(width: 50)
        }
    }
}
    
struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

