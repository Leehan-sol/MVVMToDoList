//
//  DoneViewModel.swift
//  MVVMToDoList
//
//  Created by hansol on 2023/12/16.
//

import Foundation


class DoneViewModel {
    var dataManager: SendDataProtocol
    
    init(dataManager: SendDataProtocol) {
        self.dataManager = dataManager
    }
    
    var doneListCount: Int {
        return dataManager.doneList.count
    }
    
    func doneItem(at index: Int) -> DoneListModel? {
           guard index >= 0, index < dataManager.doneList.count else {
               return nil
           }
           return dataManager.doneList[index]
       }
}
