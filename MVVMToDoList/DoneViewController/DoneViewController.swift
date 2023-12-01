//
//  DoneViewController.swift
//  MVVMToDoList
//
//  Created by t2023-m0048 on 2023/11/30.
//

import UIKit

class DoneViewController: UIViewController {
    
    // MARK: - Properties
    private let doneView = DoneView()
    var doneList: [DoneListModel] = []
    var delegate: TodoListDelegate?

    // MARK: - Life Cycle
    override func loadView() {
        view = doneView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTableView()
    }
    
    
    // MARK: - Func
    private func setUI(){
        view.backgroundColor = .systemBackground
    }
    
    
    private func setTableView(){
        doneView.doneTableView.delegate = self
        doneView.doneTableView.dataSource = self
        doneView.doneTableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "TVCell")
    }


}


// MARK: - UITableViewDelegate
extension DoneViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    }

}

// MARK: - UITableViewDataSource
extension DoneViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        doneList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath) as? TodoTableViewCell else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = doneList[indexPath.row].description
        cell.doneSwitch.isOn = doneList[indexPath.row].isCompleted
        
        return cell
    }
    
    
    
    
}
