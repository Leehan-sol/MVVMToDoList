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
    var viewModel: DoneViewModel
    
    // MARK: - Life Cycle
    init(viewModel: DoneViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        return viewModel.doneListCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath) as? TodoTableViewCell else {
            return UITableViewCell()
        }
        
        if let doneItem = viewModel.doneItem(at: indexPath.row) {
            cell.textLabel?.text = doneItem.description
            cell.doneSwitch.isOn = doneItem.isCompleted
        }
        return cell
    }
    
}
