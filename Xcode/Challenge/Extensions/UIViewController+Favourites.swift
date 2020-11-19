//
//  UIViewController+Storage.swift
//  Challenge
//
//  Created by Camilo Castro on 08-09-20.
//  Copyright © 2020 SoSafe. All rights reserved.
//

import UIKit
import API
import Storage

extension UIViewController {
    
    func saveLocationToFavourites(annotation: GooglePlacePointAnnotation) {
        let key = annotation.place!.uid
        let content:String = annotation.place!.json
        Storage.engine.save(key:key, content:content)
    }
    
    func removeLocationFromFavourites(annotation: GooglePlacePointAnnotation) {
        let key = annotation.place!.uid
        Storage.engine.delete(key:key)
    }
}
