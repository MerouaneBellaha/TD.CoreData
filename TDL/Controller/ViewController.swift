//
//  ViewController.swift
//  TDL
//
//  Created by Merouane Bellaha on 22/06/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noTaskLabel: UILabel!

    private var tasks: [Task] = [] { didSet {
        noTaskLabel.text = tasks.isEmpty ? "no task" : .none
        tasks = tasks.sort
        tableView.reloadData()
        }}

    var coreDataManager: CoreDataManager?

    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        coreDataManager = CoreDataManager(with: context)
        loadAllTasks()
    }

    @IBAction func addTaskTapped(_ sender: Any) {
        setAlert { task in
            self.manageNewTask(task: task)
        }
    }

    @IBAction func resetTapped(_ sender: Any) {
        coreDataManager?.deleteItems(from: tasks)
        tasks.removeAll()
        coreDataManager?.saveTasks()
    }

    private func manageNewTask(task: String) {
        let newTask = Task(context: context)
        newTask.taskName = task

        tasks.append(newTask)
        coreDataManager?.saveTasks()
    }

    private func loadAllTasks() {
        tasks = coreDataManager?.loadItems() ?? []
    }
}


@available(iOS 13.0, *)
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].taskName
        return cell
    }
}



