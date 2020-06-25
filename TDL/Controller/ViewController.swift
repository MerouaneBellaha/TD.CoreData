//
//  ViewController.swift
//  TDL
//
//  Created by Merouane Bellaha on 22/06/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noTaskLabel: UILabel!

    var coreDataManager: CoreDataManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    @IBAction func addTaskTapped(_ sender: Any) {
        setAlert { [unowned self] in
            self.coreDataManager?.createItem(named: $0)
            self.tableView.reloadData()
        }
    }

    @IBAction func resetTapped(_ sender: Any) {
        coreDataManager?.deleteItems()
        tableView.reloadData()
    }
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        noTaskLabel.text = coreDataManager?.loadItems().isEmpty ?? true ? "no task" : .none
        return coreDataManager?.loadItems().count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        cell.textLabel?.text = coreDataManager?.loadItems()[indexPath.row].taskName
        return cell
    }
}



