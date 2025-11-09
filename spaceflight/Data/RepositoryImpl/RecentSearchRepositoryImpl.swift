//
//  RecentSearchRepositoryImpl.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation
import CoreData

protocol RecentSearchRepository {
    func addSearch(query: String)
    func fetchAll(limit: Int) -> [RecentSearchModel]
    func clearAll()
}

final class RecentSearchRepositoryImpl: RecentSearchRepository {
    private var context = CoreDataStack.shared.context
    
    init(context: NSManagedObjectContext = CoreDataStack.shared.context) {
            self.context = context
        }

    func addSearch(query: String) {
        let entity = RecentSearch(context: context)
        entity.query = query
        entity.timestamp = Date()
        try? context.save()
    }

    func fetchAll(limit: Int = 20) -> [RecentSearchModel] {
        let req: NSFetchRequest<RecentSearch> = RecentSearch.fetchRequest()
        req.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
        req.fetchLimit = limit
        let items = (try? context.fetch(req)) ?? []
        return items.map { RecentSearchModel(query: $0.query ?? "", timestamp: $0.timestamp ?? Date()) }
    }

    func clearAll() {
//        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "RecentSearch")
//        let del = NSBatchDeleteRequest(fetchRequest: fetch)
//        _ = try? context.execute(del)
//        CoreDataStack.shared.saveContext()
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "RecentSearch")

            if context.persistentStoreCoordinator?.persistentStores.first?.type == NSInMemoryStoreType {
                // 🔹 fallback for in-memory store
                let objects = (try? context.fetch(fetch)) as? [NSManagedObject] ?? []
                for obj in objects {
                    context.delete(obj)
                }
                try? context.save()
            } else {
                // 🔹 use fast batch delete for SQLite
                let del = NSBatchDeleteRequest(fetchRequest: fetch)
                _ = try? context.execute(del)
                try? context.save()
            }
    }
}
