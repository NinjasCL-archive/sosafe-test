//
//  ViewController.swift
//  Challenge
//
//  Created by Camilo Castro on 06-09-20.
//  Copyright © 2020 SoSafe. All rights reserved.
//

import UIKit
import MapKit
import Shared
import API

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var debounce:Timer?
    var lastQuery:String = ""
    
    // Mark - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showCurrentLocationIn(map: self.map)
        self.map.delegate = self
        self.showNearbyPointsOfInterestIn(map: self.map, keyword: self.lastQuery)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // Mark - Map Delegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = annotation.title! ?? ""
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier) as? MKMarkerAnnotationView {
              dequeuedView.annotation = annotation
              view = dequeuedView
                return view
        }
        
        
        view = MKMarkerAnnotationView(
        annotation: annotation,
        reuseIdentifier: identifier)

        view.canShowCallout = true

        view.calloutOffset = CGPoint(x: -5, y: 5)

        let infoButton = UIButton(type: .detailDisclosure)
        infoButton.tag = GooglePlacePointAnnotationCallouts.info.rawValue
        
        view.rightCalloutAccessoryView = infoButton

        let addFavsButton = UIButton(type:.contactAdd)
        addFavsButton.tag = GooglePlacePointAnnotationCallouts.favs.rawValue
        
        view.leftCalloutAccessoryView = addFavsButton
        
        return view
    }

    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        // https://stackoverflow.com/a/53802335
        debounce?.invalidate()
        debounce = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: {_ in
            Shared.log.trace("Changed Map Region \(mapView.region.center)")
            self.showNearbyPointsOfInterestIn(map: mapView, keyword: self.lastQuery)
        })
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard view.annotation is GooglePlacePointAnnotation else { return }
        
        if(control.tag == GooglePlacePointAnnotationCallouts.info.rawValue) {
            Shared.log.info("Presenting Info Detail")
            
            self.performSegue(withIdentifier: "favsSegue", sender: self)
            
            return;
        }
        
        Shared.log.info("Adding Location to Favourites")
        self.saveLocationToFavourites(annotation: view.annotation as! GooglePlacePointAnnotation)
    }

    // Mark - UIActions
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        self.showMapPlaceKeywordSearchAlert({query in
            self.lastQuery = query
            self.showNearbyPointsOfInterestIn(map: self.map, keyword: self.lastQuery)
        })
    }
    
}

