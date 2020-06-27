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

    func loadItems(with text: String? = nil) -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()

        if let text = text {
            request.predicate = NSPredicate(format: "taskName CONTAINS[cd] %@", text)
        }

        request.sortDescriptors = [NSSortDescriptor(key: "taskName", ascending: true)]

        guard let items = try? context.fetch(request) else { return [] }
        return items
    }

    func deleteItems() {
        loadItems().forEach { context.delete($0)}
        coreDataStack.saveContext()
    }

    func deleteItem(item: Task) {
        context.delete(item)
        coreDataStack.saveContext()
    }

    func createItem(named name: String) {
        let newItem = Task(context: context)
        newItem.taskName = name
        coreDataStack.saveContext()
    }
}



