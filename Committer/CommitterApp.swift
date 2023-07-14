//
//  CommitterApp.swift
//  Committer
//
//  Created by Jacob Conner on 7/7/23.
//

import SwiftUI

@main
struct CommitterApp: App {
    @StateObject private var dataController = DataController()

    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
