//
//  spaceflightApp.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import SwiftUI
import CoreData

@main
struct spaceflightApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
