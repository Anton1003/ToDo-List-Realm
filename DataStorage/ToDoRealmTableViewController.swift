//
//  ToDoRealmTableViewController.swift
//  DataStorage
//
//  Created by User on 03.12.2020.
//

import UIKit

class ToDoRealmTableViewController: UITableViewController {
    @IBAction func pushEditAction(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    //MARK: - Добавление записи в интерфейсе
    @IBAction func pushAddAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Create new item", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "New item name"
        }
        let alertAction1 = UIAlertAction(title: "Cancel", style: .default) { (alert) in
             
        }
        let alertAction2 = UIAlertAction(title: "Create", style: .cancel) { (alert) in
            // добавить новую запись
            let newItem = alertController.textFields![0].text
            addItem(nameItem: newItem!)
            self.tableView.reloadData()
        }
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        present(alertController, animated: true, completion: nil)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //MARK: - Количество ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoItems.count
    }

    //MARK: - Описание ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RealmCell", for: indexPath)
        let currentItem = ToDoItems[indexPath.row]
        cell.textLabel?.text = currentItem["Name"] as? String
        
        if (currentItem["isCompleted"] as? Bool) == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
    

    //MARK: - Режим редактирования
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    //MARK: - Удаление ячейки
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            removeItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
           
        }    
    }
    
    //MARK: - Установка чек-марки
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if changeState(at: indexPath.row) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
       
    }

    //MARK: - Перемещение
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        moveItem(fromIndex: fromIndexPath.row, toIndex: to.row)
        tableView.reloadData()

    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
