//
//  ViewController.swift
//  MVVMToDoList
//
//  Created by t2023-m0048 on 2023/11/30.

//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let mainView = MainView()
    private let dataManager = DataManager()
    private var mainViewModel: MainViewModel!
    
    // MARK: - Life Cycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddtarget()
        setViewModel()
    }
    
    
    
    // MARK: - Func
    private func setUI(){
        view.backgroundColor = .systemBackground
    }
    
    private func setAddtarget(){
        mainView.goTodoButton.addTarget(self, action: #selector(goTodoButtonTapped), for: .touchUpInside)
        mainView.goDoneButton.addTarget(self, action: #selector(goDoneButtonTapped), for: .touchUpInside)
    }
    
    private func setViewModel(){
        mainViewModel = MainViewModel(dataManager: dataManager)
    }
    
    
    
    // MARK: - @objc
    @objc func goTodoButtonTapped() {
        // TodoViewModel 생성 및 dataManager 전달
        let todoViewModel = TodoViewModel(dataManager: dataManager)
        
        // TodoViewController에 TodoViewModel 설정
        let todoVC = TodoViewController()
        todoVC.viewModel = todoViewModel
        
        self.navigationController?.pushViewController(todoVC, animated: true)
    }
    
    @objc func goDoneButtonTapped(){
        let doneViewModel = DoneViewModel(dataManager: dataManager)
        let doneVC = DoneViewController()
        doneVC.viewModel = doneViewModel
        self.navigationController?.pushViewController(doneVC, animated: true)
    }
    
    
    
}
