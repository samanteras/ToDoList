//
//  ModelList.swift
//  ToDoList
//
//  Created by MAC13 on 11.10.2022.
//

import Foundation

var toDoList: [[String: Any]] = [["Name": "Позавтракать", "isComplited": true], ["Name": "Найти работу", "isComplited": false], ["Name": "Заработать денег", "isComplited": false]]


func addItem(nameItem: String, isCompleted: Bool = false) {
    toDoList.append(["Name":nameItem, "isComplited": isCompleted])
    saveData()
}

func removeItem(item: Int) {
    toDoList.remove(at: item)
    saveData()
}

func changeState(index: Int) -> Bool {
    toDoList[index]["isComplited"] = !(toDoList[index]["isComplited"] as! Bool)
    saveData()
    return toDoList[index]["isComplited"] as! Bool
}

func saveData(){
    
}

func loadData() {
    
}
