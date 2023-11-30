//
//  TodoTableViewCell.swift
//  MVVMToDoList
//
//  Created by t2023-m0048 on 2023/11/30.
//

import UIKit
import SnapKit
import Then

class TodoTableViewCell: UITableViewCell {
    
    // MARK: - UI Properties
    let titleLabel = UILabel().then {
        $0.numberOfLines = 0
    }
    
    let doneSwitch = UISwitch().then {
        $0.isEnabled = true
    }
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Func
    func setUI(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(doneSwitch)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(50)
        }
        
        doneSwitch.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }
        
    }
    
    
}
