//
//  TodoViewController.swift
//  MVVMToDoList
//
//  Created by t2023-m0048 on 2023/11/30.
//

import UIKit

class TodoViewController: UIViewController {
    
    // MARK: - Properties
    private let todoView = TodoView()
    private let doneVC = DoneViewController()
    var todoList: [TodoListModel] = []
    var delegate: TodoListDelegate?
    
    // MARK: - Life Cycle
    override func loadView() {
        view = todoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddtarget()
        setTableView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        delegate?.sendTodo(data: todoList)
    }
    
    // MARK: - Func
    func setUI(){
        view.backgroundColor = .systemBackground
    }
    
    func setAddtarget(){
        todoView.addTodoButton.addTarget(self, action: #selector(addTodoButtonTapped), for: .touchUpInside)
    }
    
    func setTableView(){
        todoView.todoTableView.delegate = self
        todoView.todoTableView.dataSource = self
        todoView.todoTableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "TVCell")
    }
    
    
    // MARK: - @objc
    // 할일 추가
    @objc func addTodoButtonTapped() {
        let alertController = UIAlertController(title: "Add Todo", message: "", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Todo"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] action in
            guard let content = alertController.textFields?.first?.text else { return }
            if content.isEmpty { return }
            
            let newTodo = TodoListModel(description: content, isCompleted: false)
            
            self?.todoList.append(newTodo)
            self?.todoView.todoTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

// MARK: - UITableViewDelegate
extension TodoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // 할일 삭제 메소드
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}


// MARK: - UITableViewDataSource
extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath) as? TodoTableViewCell else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = todoList[indexPath.row].description
        cell.doneSwitch.isOn = todoList[indexPath.row].isCompleted
        
        cell.doneSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        return cell
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        guard let cell = sender.superview?.superview as? TodoTableViewCell,
              let indexPath = todoView.todoTableView.indexPath(for: cell) else {
            return
        }
        
        var todoItem = todoList[indexPath.row]
        
        todoItem.isCompleted = sender.isOn
        
        // Print switch value change information
        print("Switch value changed for \(todoItem.description): \(sender.isOn)")
        
        // Update doneList based on the switch value
        //        if sender.isOn {
        //            doneVC.doneList.append(todoItem)
        //        } else {
        //            if let index = doneList.firstIndex(where: { $0.description == todoItem.description }) {
        //                doneVC.doneList.remove(at: index)
        //            }
        //        }
    }
    
    
}
