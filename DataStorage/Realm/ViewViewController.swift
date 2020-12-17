
import UIKit
import RealmSwift

class ViewViewController: UIViewController {
    
    public var item: ToDoListItem?
    public var deletionHandler: (() -> Void)?
    
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    private var realm = try! Realm()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemLabel.text = item?.item
        dateLabel.text = ViewViewController.dateFormatter.string(from: item!.date)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButton)), UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapDelet))]
        
    }
    
    @objc private func doneButton() {
      

//        realm.beginWrite()
//        realm.add(doneItem)
//        try! realm.commitWrite()

        
   //     navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func didTapDelet() {
        guard let myItem = self.item else {
            return
        }
        
        realm.beginWrite()
        realm.delete(myItem)
        try! realm.commitWrite()
        
        deletionHandler?()
        navigationController?.popToRootViewController(animated: true)
        
    }
    
}
