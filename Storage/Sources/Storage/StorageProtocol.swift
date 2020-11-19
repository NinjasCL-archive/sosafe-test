//
//  
//
//  Created by Camilo Castro on 08-09-20.
//

import Foundation

public protocol StorageProtocol {
    func save(key:String, content:String)
    func delete(key:String)
    func get(key:String) -> String?
}
