//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Martin Angers on 2014-06-08.
//  Copyright (c) 2014 Martin Angers. All rights reserved.
//

import UIKit

class ToDoItem {
    var itemName: String?
    var completed = false
    let creationDate = NSDate()
    
    init(itemName: String) {
        self.itemName = itemName
    }
}
