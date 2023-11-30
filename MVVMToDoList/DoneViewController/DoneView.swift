//
//  DoneView.swift
//  MVVMToDoList
//
//  Created by t2023-m0048 on 2023/11/30.
//

import UIKit
import SnapKit
import Then

class DoneView: UIView {
    
    //MARK: - UI Properties
    let doneTableView = UITableView().then {
        $0.separatorStyle = .none
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
        addSubview(doneTableView)
        
        doneTableView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
        
    }
    

}
