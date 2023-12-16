//
//  TodoItemColor.swift
//  MVVMToDoList
//
//  Created by hansol on 2023/12/16.
//

import UIKit

enum TodoItemColor {
    case completed
    case notCompleted

    func textColor() -> UIColor {
        switch self {
        case .completed:
            return .gray
        case .notCompleted:
            return .black
        }
    }
}
