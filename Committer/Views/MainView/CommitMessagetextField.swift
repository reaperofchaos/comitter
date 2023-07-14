//
//  Title.swift
//  Committer
//
//  Created by Jacob Conner on 7/7/23.
//

import Foundation
import SwiftUI

struct CommitMessageTextField: View {
    @Binding var message: String

    var body: some View {
        HStack{
            Text("Type a Commit Message").bold()
            TextField("Commit Message", text: $message)
        }
    }
}


