import UIKit
import MapKit


extension UIViewController {
    func showCurrentLocationIn(map:MKMapView, distance:CLLocationDistance = 2000) {
        guard let location = map.userLocation.location?.coordinate else { return }
        
        let region = MKCoordinateRegion(center: location,
                                        latitudinalMeters: distance,
                                        longitudinalMeters: distance)
        
        map.setRegion(region, animated: true)
    }
}
