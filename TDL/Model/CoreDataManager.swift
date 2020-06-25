//
//  CoreDataManager.swift
//  Todoey
//
//  Created by Merouane Bellaha on 14/06/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import CoreData

final class CoreDataManager {
    var context: NSManagedObjectContext
    var coreDataStack: CoreDataStack

    init(with coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
        self.context = coreDataStack.context
    }

    func loadItems() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "taskName", ascending: true)]

        var items: [Task] {
            guard let items = try? context.fetch(request) else { return [] }
            return items
        }
        return items
    }

    func deleteItems() {
        loadItems().forEach { context.delete($0)}
        coreDataStack.saveContext()
    }

    func createItem(named name: String) {
        let newItem = Task(context: context)
        newItem.taskName = name
        coreDataStack.saveContext()
    }
}



