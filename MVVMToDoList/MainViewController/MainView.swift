//
//  MainView.swift
//  MVVMToDoList
//
//  Created by t2023-m0048 on 2023/11/30.
//

import UIKit
import SnapKit
import Then

class MainView: UIView {
    
    // MARK: -UI Properties
    let goTodoButton = UIButton().then {
        $0.setTitle("TodoList", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let goDoneButton = UIButton().then {
        $0.setTitle("DoneList", for: .normal)
        $0.setTitleColor(.black, for: .normal)
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
        addSubview(goTodoButton)
        addSubview(goDoneButton)
        
        goTodoButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        goDoneButton.snp.makeConstraints {
            $0.top.equalTo(goTodoButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
    }
    
}
