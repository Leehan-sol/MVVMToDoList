//
//  MainViewModel.swift
//  MVVMToDoList
//
//  Created by hansol on 2023/12/16.
//

import Foundation


class MainViewModel {
    let dataManager: SendDataProtocol
    
    init(dataManager: SendDataProtocol) {
        self.dataManager = dataManager
    }

}
