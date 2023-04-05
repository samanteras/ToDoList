//
//  ModelList.swift
//  ToDoList
//
//  Created by MAC13 on 11.10.2022.
//

import Foundation
import UserNotifications
import UIKit

var toDoList: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoData")
      //  UserDefaults.standard.synchronize()
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoData") as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
}

class Teor {
    init(){
        
    }
}

func addItem(nameItem: String, isCompleted: Bool = false) {
    toDoList.append(["Name":nameItem, "isComplited": isCompleted])
    setBadge()
}

func removeItem(item: Int) {
    toDoList.remove(at: item)
    setBadge()
}

func moveRowAt(fromIndex: Int, to: Int){
    let from = toDoList[fromIndex]
    toDoList.remove(at: fromIndex)
    toDoList.insert(from, at: to)
    
}

func changeState(index: Int) -> Bool {
    toDoList[index]["isComplited"] = !(toDoList[index]["isComplited"] as! Bool)
    setBadge()
    return toDoList[index]["isComplited"] as! Bool
   
}

func reauestForNotification() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.badge]) { (isEnabled, error) in }
}

func setBadge() {
    var listOfBadge = 0
    for item in toDoList {
        if (item["isComplited"] as? Bool) == false {
            listOfBadge = listOfBadge + 1
        }
        
    }
    UIApplication.shared.applicationIconBadgeNumber = listOfBadge
}
