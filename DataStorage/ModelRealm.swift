
import Foundation
import RealmSwift



class Item: Object {
//MARK: - Сохранение
      @objc dynamic var ToDoItems: [[String:Any]] = []
//{
//    set {
//        UserDefaults.standard.setValue(newValue, forKey: "ToDoDataKey")
//        UserDefaults.standard.synchronize()
//    }
//    get {
//        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String:Any]] {
//            return array
//        } else {
//            return []
//        }
//    }
//}

//MARK: - Добавление записи
    func addItem(item: Item) {
    
    //ToDoItems.append(["Name": nameItem, "isCompleted": isCompleted])
}
//MARK: - Удаление записи
func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
}

//MARK: - Перемещение записей
func moveItem (fromIndex: Int, toIndex: Int) {
    let from = ToDoItems[fromIndex]
    ToDoItems.remove(at: fromIndex)
    ToDoItems.insert(from, at: toIndex )
}

func changeState(at item: Int) -> Bool {
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
    return ToDoItems[item]["isCompleted"] as! Bool
}
}
