//
//  Array+sortAlphabetically.swift
//  TDL
//
//  Created by Merouane Bellaha on 22/06/2020.
//  Copyright © 2020 Merouane Bellaha. All rights reserved.
//

import Foundation

extension Array where Element == Task {
    /// sort a [Task] alphabetically
    var sortAlphabetically: [Task] {
        self.sorted() { first, second in
            guard let first = first.taskName, let second = second.taskName else { return false }
            return first < second
        }
    }
}
