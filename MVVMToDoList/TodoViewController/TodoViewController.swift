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
    var viewModel: TodoViewModel!
    
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
    
    deinit {
        print("TodoViewController deinitialized")
    }
    
    // MARK: - Func
    private func setUI(){
        view.backgroundColor = .systemBackground
    }
    
    private func setAddtarget(){
        todoView.addTodoButton.addTarget(self, action: #selector(addTodoButtonTapped), for: .touchUpInside)
    }
    
    private func setTableView(){
        todoView.todoTableView.delegate = self
        todoView.todoTableView.dataSource = self
        todoView.todoTableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "TVCell")
    }
    
    
    // MARK: - @objc
    // 할일 추가
    @objc func addTodoButtonTapped() {
        viewModel.alertManager.showAlertWithTF(from: self,
                                               title: "할일 추가하기",
                                               message: "",
                                               tfText: "할일",
                                               button1Title: "추가",
                                               button2Title: "취소") { content in
            if !content.isEmpty {
                self.viewModel.addTodo(description: content)
                self.todoView.todoTableView.reloadData()
            }
        }
    }
    
}


// MARK: - UITableViewDelegate
extension TodoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // 할일 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.removeTodo(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}


// MARK: - UITableViewDataSource
extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todoListCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath) as? TodoTableViewCell else {
            return UITableViewCell()
        }
        
        if var todoItem = viewModel.todoItem(at: indexPath.row) {
            cell.textLabel?.text = todoItem.description
            cell.doneSwitch.isOn = todoItem.isCompleted
            cell.textLabel?.textColor = viewModel.getTextColor(at: indexPath.row).textColor()
            
            // 클로저 설정
            cell.switchChangedHandler = { [weak self] isOn in
                guard let self = self else { return }
                
                if isOn {
                    todoItem.isCompleted = true
                    self.viewModel.addDone(description: todoItem.description)
                } else {
                    todoItem.isCompleted = false
                    self.viewModel.removeDone(with: todoItem.description)
                }
                self.viewModel.dataManager.todoList[indexPath.row] = todoItem
            }
        }
        return cell
    }
}


