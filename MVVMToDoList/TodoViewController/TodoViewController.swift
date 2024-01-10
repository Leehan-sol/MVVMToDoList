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
    private let viewModel: TodoViewModel
    
    // MARK: - Life Cycle
    init(viewModel: TodoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        var todoItem = viewModel.todoItem(at: indexPath.row)
        cell.todoItem = todoItem
        
        // ✨ 셀 스위치 왔다갔다하면 셀의 todoItem이 바뀌게 설정해줘야함
        // 1. isCompleted 상태변경 2. 던리스트 추가 빼기
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
        return cell
    }
    
}



