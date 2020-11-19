import Foundation
import Shared

public final class StorageUserDefaults : StorageProtocol {
    
    public static let shared = StorageUserDefaults()
    
    public func save(key: String, content: String) {
        Shared.log.info("Saving to Database")
        Shared.log.trace("Key; \(key): \(content)")
        UserDefaults.standard.set(content, forKey: key)
    }
    
    public func delete(key: String) {
        Shared.log.info("Deleting from Database")
        Shared.log.trace("\(key)")
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    public func get(key: String) -> String? {
        Shared.log.info("Getting from Database")
        Shared.log.trace("\(key)")
        return UserDefaults.standard.string(forKey: key)
    }
}
