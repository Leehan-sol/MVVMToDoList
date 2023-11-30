//
//  ViewController.swift
//  MVVMToDoList
//
//  Created by t2023-m0048 on 2023/11/30.

//

import UIKit

protocol TodoListDelegate {
    func sendTodo(data: [TodoListModel])
}

class MainViewController: UIViewController {
    
    // MARK: - Properties
    let mainView = MainView()
    var todo = [TodoListModel]()
    
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
        self.navigationController?.pushViewController(doneVC, animated: true)
    }
    
    
    
}



extension MainViewController: TodoListDelegate {
    
    func sendTodo(data: [TodoListModel]) {
        self.todo = data
    }
}
