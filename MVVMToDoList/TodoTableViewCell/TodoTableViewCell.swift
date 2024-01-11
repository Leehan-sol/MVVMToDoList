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
    
    var viewModel: TodoItemViewModel? {
          didSet {
              configureUI()
          }
      }

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
        setSwitchTarget()
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
    
    func setSwitchTarget() {
        doneSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
    }

    func configureUI() {
         guard let viewModel = viewModel else { return }
         titleLabel.text = viewModel.title
         doneSwitch.isOn = viewModel.isCompleted
         titleLabel.textColor = viewModel.isCompleted ? .gray : .black
     }

  
    @objc func switchChanged(_ sender: UISwitch) {
        viewModel?.handleSwitchToggle(isOn: sender.isOn)
        configureUI()
    }
    
}
