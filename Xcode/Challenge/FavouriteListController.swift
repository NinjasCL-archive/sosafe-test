//
//  FavouriteListController.swift
//  Challenge
//
//  Created by Camilo Castro on 06-09-20.
//  Copyright © 2020 SoSafe. All rights reserved.
//

import UIKit
import API
import Storage
import Shared

let favCell = "favCell"

class FavouriteListController : UITableViewController {
    
    var items : [String:Any] {
        return Storage.engine.all()
    }
    
    func itemForIndexPath(_ indexPath: IndexPath) -> GooglePlacesNearbyQueryPlace? {
        let items = Array(self.items.values)
        let json = items[indexPath.row]
        
        print("JSON: \(json)")
        
        let item = GooglePlacesNearbyQueryPlace.from(json: json as! String)
        return item
    }
    
    // Mark - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Shared.log.info("Loading Favourites List")
        Shared.log.trace("\(self.items.values.count)")
    }
 
    // Mark - Table View Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.values.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let item = self.itemForIndexPath(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: favCell, for:indexPath)
        
        cell.textLabel?.text = item?.name
        
        return cell
    }
    
}
