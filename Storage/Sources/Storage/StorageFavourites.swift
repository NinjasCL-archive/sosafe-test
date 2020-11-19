
import Foundation

let favskey = "com.sosafe.locations"

public final class StorageFavourites : StorageProtocol {
    
    public static let shared = StorageFavourites()
    
    func getFavs() -> [String:Any] {
        return UserDefaults.standard.dictionary(forKey: favskey) ?? [String:String]()
    }
    
    public func save(key: String, content: String) {
        var favs = getFavs()
        favs[key] = content
        UserDefaults.standard.set(favs, forKey: favskey)
    }
    
    public func delete(key: String) {
        var favs = getFavs()
        favs.removeValue(forKey: key)
        UserDefaults.standard.set(favs, forKey: favskey)
    }
    
    public func get(key: String) -> String? {
        let favs = getFavs()
        let content = favs[key]
        return content as? String
    }
    
    public func all() -> [String:Any] {
        return getFavs()
    }
}
