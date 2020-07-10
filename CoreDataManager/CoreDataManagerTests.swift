//
//  CoreDataManager.swift
//  CoreDataManager
//
//  Created by Merouane Bellaha on 25/06/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//


@testable import TDL
import XCTest

class CoreDataManagerTests: XCTestCase {

    var coreDataStack: FakeCoreDataStack!
    var coreDataManager: CoreDataManager!

    override func setUp() {
        super.setUp()
        coreDataStack = FakeCoreDataStack()
        coreDataManager = CoreDataManager(with: coreDataStack)
    }

    override func tearDown() {
        super.tearDown()
        coreDataStack = nil
        coreDataManager = nil
    }

    func testGivenCoreDataManagerIsEmpty_WhenCreateAnItem_ThenCoreDataManagerShouldHaveOneTaskNamedATask() {
        coreDataManager.createItem(named: "A task")

        XCTAssertTrue(coreDataManager.loadItems().count == 1)
        XCTAssertTrue(coreDataManager.loadItems().first?.taskName == "A task")
    }

    func testGivenCoreDataManagerIsNotEmpty_WhenDeleteAllTasks_ThenCoreDataManagerShouldBeEmpty() {
        coreDataManager.createItem(named: "A task")

        coreDataManager.deleteItems()

        XCTAssertTrue(coreDataManager.loadItems().isEmpty)

    }

    func testGivenCoreDataManagerContainsTwoTasks_WhenDeleteTheFirstTask_ThenCoreDataManagerShouldContainsOnlyTheSecondTask() {
        coreDataManager.createItem(named: "First Task")
        coreDataManager.createItem(named: "Second Task")

        guard let firstTask = coreDataManager.loadItems(containing: "First Task").first else { return }

        coreDataManager.deleteItem(item: firstTask)

        XCTAssertTrue(coreDataManager.loadItems().count == 1)
        XCTAssertTrue(coreDataManager.loadItems().first?.taskName == "Second Task")

    }
}
