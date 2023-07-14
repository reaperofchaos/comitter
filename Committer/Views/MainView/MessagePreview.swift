//
//  Title.swift
//  Committer
//
//  Created by Jacob Conner on 7/7/23.
//

import Foundation
import SwiftUI

struct MessagePreviewComponent: View {
    @Binding var commit: String

    var body: some View {
        if(commit != ""){
            Text("\(commit)").font(.subheadline)
        }
    }
}

//struct MessagePreviewComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        MessagePreviewComponent(commit: "test")
//    }
//}
