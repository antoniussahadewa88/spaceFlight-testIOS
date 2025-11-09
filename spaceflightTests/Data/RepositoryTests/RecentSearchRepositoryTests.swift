//
//  RecentSearchRepositoryTests.swift
//  spaceflightTests
//
//  Created by Antonius Krisna Sahadewa on 09/11/25.
//

import XCTest
import CoreData
@testable import spaceflight

final class RecentSearchRepositoryTests: XCTestCase {
    var repo: RecentSearchRepositoryImpl!
    var context: NSManagedObjectContext!
    
    override func setUp() {
        super.setUp()
        context = MockCoreDataStack.makeInMemoryContext()
        repo = RecentSearchRepositoryImpl(context: context)
    }
    
    override func tearDown() {
        repo = nil
        context = nil
        super.tearDown()
    }
    
    func testAddSearch_addsItemToCoreData(){
        repo.addSearch(query: "SpaceX")
        let results = repo.fetchAll(limit:10)
        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results.first?.query, "SpaceX")
    }
    
    func testFetchAll_returnsOrderedItems(){
        repo.addSearch(query: "A")
        sleep(1) //ini untuk inisiasi berharap waktu yang berbeda
        repo.addSearch(query: "B")
        
        let results = repo.fetchAll(limit: 10)
        XCTAssertEqual(results.count, 2)
        XCTAssertEqual(results.first?.query, "B")
    }
    
    func testClearAll_removeAllItems() {
        repo.addSearch(query: "DeleteMe")
        repo.clearAll()
        
        let results = repo.fetchAll(limit: 10)
        XCTAssertTrue(results.isEmpty)
    }
}
