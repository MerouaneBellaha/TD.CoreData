////
////  CoreDataManager.swift
////  CoreDataManager
////
////  Created by Merouane Bellaha on 25/06/2020.
////  Copyright © 2020 Merouane Bellaha. All rights reserved.
////
//
//
//@testable import TDL
//import XCTest
//
//class CoreDataManagerTests: XCTestCase {
//
//    var coreDataStack: FakeCoreDataStack!
//    var coreDataManager: CoreDataManager!
//
//    override func setUp() {
//        super.setUp()
//        coreDataStack = FakeCoreDataStack()
//        coreDataManager = CoreDataManager(with: coreDataStack)
//    }
//
//    override func tearDown() {
//        super.tearDown()
//        coreDataStack = nil
//        coreDataManager = nil
//    }
//
//    func testGivenCoreDataManagerIsEmpty_WhenCreateAnItem_ThenCoreDataManagerShouldHaveOneTask() {
//        coreDataManager.createItem(named: "A task")
//        print(coreDataManager.loadItems().count)
//        XCTAssertTrue(coreDataManager.loadItems().count == 1)
//
//
//    }
//
////    func testGiven<#Given#>_When<#When#>_Then<#Then#>() {
////    <#code#>
////    }
//
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
