////
////  FakeCoreDataStack.swift
////  CoreDataManager
////
////  Created by Merouane Bellaha on 25/06/2020.
////  Copyright © 2020 Merouane Bellaha. All rights reserved.
////
//
//import TDL
//import Foundation
//import CoreData
//
//final class FakeCoreDataStack: CoreDataStack {
//
//    // MARK: - Initializer
//
//    convenience init() {
//        self.init(containerName: "ToDoList")
//    }
//
//    override init(containerName : String) {
//        super.init(containerName: containerName)
//        let persistentStoreDescription = NSPersistentStoreDescription()
//        persistentStoreDescription.type = NSInMemoryStoreType
//        let container = NSPersistentContainer(name: containerName)
//        container.persistentStoreDescriptions = [persistentStoreDescription]
//        container.loadPersistentStores { storeDescription, error in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        }
//        self.persistentContainer = container
//    }
//}
