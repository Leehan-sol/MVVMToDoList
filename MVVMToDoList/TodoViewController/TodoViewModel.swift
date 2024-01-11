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
    
    // 아이템 가져오기
    func todoItem(at index: Int) -> TodoListModel {
        return dataManager.todoList[index]
    }
    
    func handleSwitchToggle(for todoItem: inout TodoListModel, isOn: Bool) {
        // 스위치 상태에 따라서 수행할 작업을 구현합니다.
        if isOn {
            todoItem.isCompleted = true
            addDone(description: todoItem.description)
        } else {
            // 스위치가 꺼졌을 때의 동작을 정의합니다.
            // 예: Todo 아이템을 미완료 상태로 변경하는 작업 수행
            todoItem.isCompleted = false
            removeDone(with: todoItem.description)
        }
    }
    
    // ✨ 셀 스위치 왔다갔다하면 셀의 todoItem이 바뀌게 설정해줘야함
    // 1. isCompleted 상태변경 2. 던리스트 추가 빼기
    //        cell.switchChangedHandler = { [weak self] isOn in
    //            guard let self = self else { return }
    //
    //            if isOn {
    //                todoItem.isCompleted = true
    //                self.viewModel.addDone(description: todoItem.description)
    //            } else {
    //                todoItem.isCompleted = false
    //                self.viewModel.removeDone(with: todoItem.description)
    //            }
    //            self.viewModel.dataManager.todoList[indexPath.row] = todoItem
    //        }
    //
    
}

