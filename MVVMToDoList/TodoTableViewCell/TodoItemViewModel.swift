//
//  TodoItemViewModel.swift
//  MVVMToDoList
//
//  Created by hansol on 2024/01/11.
//

import Foundation

class TodoItemViewModel {
    var todoItem: TodoListModel

    init(todoItem: TodoListModel) {
        self.todoItem = todoItem
    }

    var title: String {
        return todoItem.description
    }

    var isCompleted: Bool {
        return todoItem.isCompleted
    }

    func handleSwitchToggle(isOn: Bool) {
        todoItem.isCompleted = isOn
    }
    
}
