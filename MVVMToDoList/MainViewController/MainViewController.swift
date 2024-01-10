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
    private var viewModel: MainViewModel
    
    // MARK: - Life Cycle
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddtarget()
    }
    
    
    // MARK: - Func
    private func setUI(){
        view.backgroundColor = .systemBackground
    }
    
    private func setAddtarget(){
        mainView.goTodoButton.addTarget(self, action: #selector(goTodoButtonTapped), for: .touchUpInside)
        mainView.goDoneButton.addTarget(self, action: #selector(goDoneButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - @objc
    @objc func goTodoButtonTapped() {
        // TodoViewModel 생성 및 dataManager 전달
        let todoVM = TodoViewModel(dataManager: viewModel.dataManager)
        
        // TodoViewController에 TodoViewModel 설정
        let todoVC = TodoViewController(viewModel: todoVM)
        
        self.navigationController?.pushViewController(todoVC, animated: true)
    }
    
    @objc func goDoneButtonTapped(){
        let doneVM = DoneViewModel(dataManager: viewModel.dataManager)
        let doneVC = DoneViewController(viewModel: doneVM)

        self.navigationController?.pushViewController(doneVC, animated: true)
    }
    
}
