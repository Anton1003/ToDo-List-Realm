
import Foundation

class NameSurnameCaching {
    
    static let shared = NameSurnameCaching()
    
    private let kNameKey = "NameSurnameCaching.kNameKey"
    
    var name: String? {
        set { UserDefaults.standard.setValue(newValue, forKey: kNameKey) }
        get { return UserDefaults.standard.string(forKey: kNameKey) }
    }
    
    private let kSurnameKey = "NameSurnameCaching.kSurnameKey"
    
    var surname: String? {
        set { UserDefaults.standard.setValue(newValue, forKey: kSurnameKey) }
        get { return UserDefaults.standard.string(forKey: kSurnameKey) }
    }
}
