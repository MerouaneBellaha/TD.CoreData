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
    @IBOutlet weak var searchBar: UISearchBar!
    
    var coreDataManager: CoreDataManager?
    var searchText: String = "" {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
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

        guard searchBar.text?.isEmpty == true else {
            return coreDataManager?.loadItems(with: searchText).count ?? 0
        }

        noTaskLabel.text = coreDataManager?.loadItems().isEmpty ?? true ? "no task" : .none
        return coreDataManager?.loadItems().count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        guard searchBar.text?.isEmpty == true else {
            cell.textLabel?.text = coreDataManager?.loadItems(with: searchText)[indexPath.row].taskName
            return cell
        }
        cell.textLabel?.text = coreDataManager?.loadItems()[indexPath.row].taskName
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            coreDataManager?.deleteItem(item: (coreDataManager?.loadItems()[indexPath.row])!)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension ViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
    }
}



