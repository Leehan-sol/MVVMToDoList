//
//  TodoViewModel.swift
//  MVVMToDoList
//
//  Created by t2023-m0048 on 2023/12/02.
//

import Foundation

class TodoViewModel {
    var dataManager: SendDataProtocol
    let alertManager = AlertManager()
    
    init(dataManager: SendDataProtocol) {
        self.dataManager = dataManager
    }
    

    // 할일 추가
    func addTodo(description: String) {
        let newTodo = TodoListModel(description: description, isCompleted: false)
        dataManager.todoList.append(newTodo)
    }
    
    func addDone(description: String) {
        let newDone = DoneListModel(description: description, isCompleted: true)
        dataManager.doneList.append(newDone)
    }
    
    // 할일 삭제
    func removeTodo(at index: Int) {
        dataManager.todoList.remove(at: index)
    }
    
    func removeDone(with description: String) {
        if let index = dataManager.doneList.firstIndex(where: { $0.description == description }) {
            dataManager.doneList.remove(at: index)
        }
    }
    
}

