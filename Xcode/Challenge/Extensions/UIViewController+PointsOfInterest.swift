import UIKit
import MapKit
import Shared
import API

extension UIViewController {
    
    func showNearbyPointsOfInterestIn(map:MKMapView, keyword:String = "") {
        Shared.log.trace("Trigger searching for \(keyword) in \(map.region.center)")
        let location = map.region.center
        
        let params = GooglePlacesNearbyQuerySearchParams(keyword, location:location)
        
        map.annotations.forEach {
          if !($0 is MKUserLocation) {
            map.removeAnnotation($0)
          }
        }
        
        API.Google.place.nearby(params, success: {response in
            Shared.log.trace("\(response)")
            response.results?.forEach{item in
                
                let annotation = GooglePlacePointAnnotation()
                annotation.title = item.name ?? ""
                annotation.coordinate = item.location
                annotation.place = item
                
                map.addAnnotation(annotation)
            }
        })
        
    }
}
