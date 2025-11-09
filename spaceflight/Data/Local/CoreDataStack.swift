//
//  CoreDataStack.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import CoreData

final class CoreDataStack {
    static let shared = CoreDataStack()
    private init() {}

    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SpaceflightData")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("💥 Core Data load error: \(error)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext { container.viewContext }

    func saveContext() {
        if context.hasChanges {
            try? context.save()
        }
    }
}
