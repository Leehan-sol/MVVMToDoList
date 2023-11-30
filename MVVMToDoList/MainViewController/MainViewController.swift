//
//  ViewController.swift
//  MVVMToDoList
//
//  Created by t2023-m0048 on 2023/11/30.

//

import UIKit

protocol TodoListDelegate {
    func sendTodo(data: [TodoListModel])
    func sendDone(data: [DoneListModel])
}

class MainViewController: UIViewController {
    
    // MARK: - Properties
    let mainView = MainView()
    var todo = [TodoListModel]()
    var done = [DoneListModel]()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddtarget()
    }
    
    // MARK: - Func
    func setUI(){
        view.backgroundColor = .systemBackground
    }
    
    func setAddtarget(){
        mainView.goTodoButton.addTarget(self, action: #selector(goTodoButtonTapped), for: .touchUpInside)
        mainView.goDoneButton.addTarget(self, action: #selector(goDoneButtonTapped), for: .touchUpInside)
    }
    
    
    
    // MARK: - @objc
    @objc func goTodoButtonTapped(){
        let todoVC = TodoViewController()
        todoVC.delegate = self
        todoVC.todoList = todo
        self.navigationController?.pushViewController(todoVC, animated: true)
    }
    
    @objc func goDoneButtonTapped(){
        let doneVC = DoneViewController()
        doneVC.delegate = self
        doneVC.doneList = done
        self.navigationController?.pushViewController(doneVC, animated: true)
    }
    
    
    
}


// MARK: - TodoListDelegate
extension MainViewController: TodoListDelegate {
    
    func sendTodo(data: [TodoListModel]) {
        self.todo = data
    }
    
    func sendDone(data: [DoneListModel]) {
        self.done = data
    }
}
