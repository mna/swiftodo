//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Martin Angers on 2014-06-07.
//  Copyright (c) 2014 Martin Angers. All rights reserved.
//

import UIKit

// The @objc attribute and the .h interface file are required because of a bug with 
// the XCode 6 beta regarding exit actions.
// See : http://stackoverflow.com/questions/24029586/xcode-6-storyboard-unwind-segue-with-swift-not-connecting-to-exit
@objc(ToDoListTableViewController) class ToDoListTableViewController: UITableViewController {

    var toDoItems = ToDoItem[]();
    
    @IBAction func unwindToList(segue: UIStoryboardSegue?)  {
        let sourceCtrl = segue!.sourceViewController as AddToDoItemViewController
        if let item = sourceCtrl.newItem {
            toDoItems.append(item)
            tableView.reloadData()
        }
    }

    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        loadInitialData()
    }
    
    func loadInitialData() {
        toDoItems.append(ToDoItem(itemName: "Mow the lawn"))
        toDoItems.append(ToDoItem(itemName: "Buy milk"))
        toDoItems.append(ToDoItem(itemName: "Buy eggs"))
        toDoItems.append(ToDoItem(itemName: "Read a book"))
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell", forIndexPath: indexPath) as UITableViewCell
        let item = toDoItems[indexPath.row]
        
        cell.textLabel.text = item.itemName!
        cell.accessoryType = item.completed ? .Checkmark : .None
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let item = toDoItems[indexPath.row]
        item.completed = !item.completed
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }
}
