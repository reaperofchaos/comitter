//
//  Title.swift
//  Committer
//
//  Created by Jacob Conner on 7/7/23.
//

import Foundation
import SwiftUI

struct OutputMessage: View {
    var output: String

    var body: some View {
        HStack(alignment: .center){
            if(output != ""){
                HStack(alignment: .center){
                    Text("Message Output:").font(.body).bold();
                    Text("\(output)").font(.body);
                }
            }else{
                Spacer()
            }
        }
    }
}

//struct MessagePreviewComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        MessagePreviewComponent(commit: "test")
//    }
//}
