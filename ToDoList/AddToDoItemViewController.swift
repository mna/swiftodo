//
//  AddToDoItemViewController.swift
//  ToDoList
//
//  Created by Martin Angers on 2014-06-07.
//  Copyright (c) 2014 Martin Angers. All rights reserved.
//

import UIKit

// Again, the @objc attribute is required to be able to link
// the textfield from the storyboard to this class.
class AddToDoItemViewController: UIViewController {
    @IBOutlet var textField : UITextField
    @IBOutlet var doneBtn : UIBarButtonItem

    var newItem: ToDoItem?
    
    override func viewDidLoad() {
        textField.becomeFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        if sender === doneBtn {
            if !textField.text.isEmpty {
                newItem = ToDoItem(itemName: textField.text)
            }
        }
    }

}
