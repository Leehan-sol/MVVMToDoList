//
//  TodoViewModel.swift
//  MVVMToDoList
//
//  Created by t2023-m0048 on 2023/12/02.
//

import Foundation

class TodoViewModel {
    var todoList: [TodoListModel] = []
    var doneList: [DoneListModel] = []
    var delegate: TodoListDelegate?
    
    // 할일 추가
    func addTodo(description: String) {
        let newTodo = TodoListModel(description: description, isCompleted: false)
        todoList.append(newTodo)
        delegate?.sendTodo(data: todoList)
    }
    
    func addDone(description: String) {
        let newDone = DoneListModel(description: description, isCompleted: true)
        doneList.append(newDone)
        delegate?.sendDone(data: doneList)
    }
    
    // 할일 삭제
    func removeTodo(at index: Int) {
        todoList.remove(at: index)
        delegate?.sendTodo(data: todoList)
    }
    
    func removeDone(with description: String) {
        if let index = doneList.firstIndex(where: { $0.description == description }) {
            doneList.remove(at: index)
            delegate?.sendDone(data: doneList)
        }
    }
    
}

