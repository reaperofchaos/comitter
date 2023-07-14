//
//  DirectorySelector.swift
//  Committer
//
//  Created by Jacob Conner on 7/8/23.
//

import Foundation
import SwiftUI

struct DirectorySelector: View {
    @Binding var commitFileData: CommitFileData?
    @Binding var selectedFolder: URL
    @Binding var selectedUserStory: String
    @Binding var selectedFeat: String

    @State var folderValue: String = ""
    
    
    var body: some View {
        HStack{
            TextField("Directory:", text: $folderValue )
            Button("Choose Folder") {
                self.selectFolder()
                commitFileData = readFile(directory: selectedFolder)
                selectedUserStory = commitFileData?.us ?? ""
                selectedFeat = commitFileData?.feat ?? ""
            }
        }
    }
    
    func selectFolder() {
        
        let folderChooserPoint = CGPoint(x: 0, y: 0)
        let folderChooserSize = CGSize(width: 500, height: 600)
        let folderChooserRectangle = CGRect(origin: folderChooserPoint, size: folderChooserSize)
        let folderPicker = NSOpenPanel(contentRect: folderChooserRectangle, styleMask: .utilityWindow, backing: .buffered, defer: true)
        
        folderPicker.canChooseDirectories = true
        folderPicker.canChooseFiles = true
        folderPicker.allowsMultipleSelection = false
        folderPicker.canDownloadUbiquitousContents = true
        folderPicker.canResolveUbiquitousConflicts = true
        
        folderPicker.begin { response in
            
            if response == .OK {
                if response == .OK {
                    let pickedFolder: URL? = folderPicker.url
                    let oldUrl: URL = selectedFolder;
                    
                    selectedFolder = pickedFolder ?? oldUrl
                    folderValue = selectedFolder.absoluteString
                }
            }
        }
    }
}
