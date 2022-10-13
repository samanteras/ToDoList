//
//  ModelList.swift
//  ToDoList
//
//  Created by MAC13 on 11.10.2022.
//

import Foundation

var toDoList: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoData")
        UserDefaults.standard.synchronize()
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoData") as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
}


func addItem(nameItem: String, isCompleted: Bool = false) {
    toDoList.append(["Name":nameItem, "isComplited": isCompleted])
}

func removeItem(item: Int) {
    toDoList.remove(at: item)
}

func changeState(index: Int) -> Bool {
    toDoList[index]["isComplited"] = !(toDoList[index]["isComplited"] as! Bool)
    return toDoList[index]["isComplited"] as! Bool
}

