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
    
    // MARK: - Output
    var todoListCount: Int {
        return dataManager.todoList.count
    }
    
    // MARK: - Func
    // 투두 추가
    func addTodo(description: String) {
        let newTodo = TodoListModel(description: description, isCompleted: false)
        dataManager.todoList.append(newTodo)
    }
    
    func addDone(description: String) {
        let newDone = DoneListModel(description: description, isCompleted: true)
        dataManager.doneList.append(newDone)
    }
    
    // 투두 삭제
    func removeTodo(at index: Int) {
        if let index = dataManager.doneList.firstIndex(where: { $0.description == dataManager.todoList[index].description }) {
            dataManager.doneList.remove(at: index)
        }
        dataManager.todoList.remove(at: index)
    }
    
    func removeDone(with description: String) {
        if let index = dataManager.doneList.firstIndex(where: { $0.description == description }) {
            dataManager.doneList.remove(at: index)
        }
    }
    
    // 투두 가져오기
    func todoItem(at index: Int) -> TodoListModel {
        return dataManager.todoList[index]
    }
    
    // 투두 isCompleted 변경
    func todoIsCompleted(isOn: Bool, at index: Int) {
        var todoItem = dataManager.todoList[index]
        
        if isOn {
            todoItem.isCompleted = true
            addDone(description: todoItem.description)
        } else {
            todoItem.isCompleted = false
            removeDone(with: todoItem.description)
        }
        dataManager.todoList[index] = todoItem
    }

}

