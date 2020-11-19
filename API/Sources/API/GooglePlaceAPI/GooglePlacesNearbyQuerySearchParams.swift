import Foundation
import CoreLocation

public typealias SearchQuery = String
public struct GooglePlacesNearbyQuerySearchParams {
    var latitude : CLLocationDegrees
    var longitude : CLLocationDegrees
    var keywords : SearchQuery
    
    public init(_ keywords:SearchQuery, latitude:CLLocationDegrees, longitude: CLLocationDegrees) {
        self.keywords = keywords
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public init(_ keywords:SearchQuery, location: CLLocationCoordinate2D) {
        self.init(keywords, latitude:location.latitude, longitude:location.longitude)
    }
}
