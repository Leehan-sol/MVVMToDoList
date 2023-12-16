//
//  DataManager.swift
//  MVVMToDoList
//
//  Created by hansol on 2023/12/16.
//

import Foundation

protocol SendDataProtocol {
    var todoList: [TodoListModel] { get set }
    var doneList: [DoneListModel] { get set }
}


class DataManager: SendDataProtocol {
    var todoList: [TodoListModel] = []
    var doneList: [DoneListModel] = []
    
}


