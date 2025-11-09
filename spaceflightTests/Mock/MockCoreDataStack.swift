//
//  MockCoreDataStack.swift
//  spaceflightTests
//
//  Created by Antonius Krisna Sahadewa on 09/11/25.
//

import CoreData
@testable import spaceflight

final class MockCoreDataStack {
    static func makeInMemoryContext() -> NSManagedObjectContext {
        let container = NSPersistentContainer(name: "SpaceflightData")
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [description]
        
        container.loadPersistentStores{ _, error in
            if let error = error {
                fatalError("❌ Failed to load in-memory store: \(error)")
            }
        }
        return container.viewContext
    }
}
