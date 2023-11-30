//
//  TodoView.swift
//  MVVMToDoList
//
//  Created by t2023-m0048 on 2023/11/30.
//

import UIKit
import SnapKit
import Then

class TodoView: UIView {
    
    //MARK: - UI Properties
    let todoTableView = UITableView().then {
        $0.separatorStyle = .none
    }
    
    let addTodoButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus.app"), for: .normal)
    }
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect){
        super.init(frame: frame)
        setUI()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Func
    private func setUI(){
        addSubview(todoTableView)
        addSubview(addTodoButton)
        
        todoTableView.snp.makeConstraints {
            $0.top.left.right.equalTo(safeAreaLayoutGuide)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
        
        addTodoButton.snp.makeConstraints {
            $0.top.equalTo(todoTableView.snp.bottom).offset(5)
            $0.right.equalTo(safeAreaLayoutGuide).offset(-20)
            
        }
    }
    

}
