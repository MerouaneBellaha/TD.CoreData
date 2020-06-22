//
//  UIViewController + setAlert.swift
//  TDL
//
//  Created by Merouane Bellaha on 22/06/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import UIKit

extension UIViewController {
    /// set an alert with a textField and and an Add button, callback contains the the textField text to save
    func setAlert(callBack: @escaping ((String) -> ())) {
        let alert = UIAlertController(title: nil, message: "Add new task", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Task"
        }
        let action = UIAlertAction(title: "Add", style: .default) { _ in
            guard let task = alert.textFields?.first?.text,
                !task.isEmpty else { return }
            callBack(task)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}
