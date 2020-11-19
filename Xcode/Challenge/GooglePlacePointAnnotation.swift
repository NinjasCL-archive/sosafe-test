//
//  MKAnnotation+GooglePlaceItem.swift
//  Challenge
//
//  Created by Camilo Castro on 08-09-20.
//  Copyright © 2020 SoSafe. All rights reserved.
//

import Foundation
import MapKit
import API

class GooglePlacePointAnnotation : MKPointAnnotation {
    public var place: GooglePlacesNearbyQueryPlace?
}

enum GooglePlacePointAnnotationCallouts: Int, Codable {
    case info = 0
    case favs = 1
}
