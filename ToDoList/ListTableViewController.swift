//
//  ListTableViewController.swift
//  ToDoList
//
//  Created by MAC13 on 11.10.2022.
//

import UIKit


class ListTableViewController: UITableViewController {

 
    @IBOutlet weak var imageCheck: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.systemGroupedBackground

    }
    var s = Teor()
    

    @IBAction func pushAddItem(_ sender: Any) {
        let alertController = UIAlertController(title: "Item name", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Create new item"
        }
        
        let alertCancel = UIAlertAction(title: "Cancel", style: .cancel)
        let alertCreate = UIAlertAction(title: "Create", style: .default) {
            [weak self] (alert) in
            let newItem = alertController.textFields![0].text
            if newItem != "" {
                addItem(nameItem: newItem!)
                self?.tableView.reloadData()
            }
            
        }
        
        alertController.addAction(alertCancel)
        alertController.addAction(alertCreate)
        
        present(alertController, animated: true)
    }
    
    @IBAction func editAction(_ sender: Any) {
       
        tableView.setEditing(!tableView.isEditing, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){ [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let currentItem = toDoList[indexPath.row]
        cell.textLabel?.text = currentItem["Name"] as? String

        if (currentItem["isComplited"] as? Bool) == true {
            cell.imageView?.image = UIImage(named: "check")
        } else {
            cell.imageView?.image = UIImage(named: "uncheck")
        }
        
        if tableView.isEditing {
            cell.textLabel?.alpha = 0.4
            cell.imageView?.alpha = 0.4
       
        } else {
            cell.textLabel?.alpha = 1
            cell.imageView?.alpha = 1
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .delete
    }

    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeItem(item: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {

        }
    }
     
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if changeState(index: indexPath.row) {
            tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "check")
        } else {
            tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "uncheck")
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        moveRowAt(fromIndex: fromIndexPath.row, to: to.row)
        tableView.reloadData()
    }

}
