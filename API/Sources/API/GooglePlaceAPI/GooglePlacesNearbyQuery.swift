import Foundation
import Alamofire
import Shared

public typealias GooglePlaceAPINearbySearchResultSuccessHandler = (GooglePlacesNearbyQueryResult) -> Void

final class GooglePlaceAPINearby {
    
    static let endpoint: URL = URL(string: "\(GooglePlaceAPIInfo.endpoint)\(GooglePlaceAPINearByEndpoints.json)")!
    
    public static func search(_ params: GooglePlacesNearbyQuerySearchParams, success: GooglePlaceAPINearbySearchResultSuccessHandler? = nil, error: (() -> Void)? = nil) {
        let key = URLQueryItem(name: "key", value: GooglePlaceAPIInfo.key)
        let keywords = URLQueryItem(name: "keyword", value: params.keywords)
        let rankby = URLQueryItem(name:"rankby", value: "distance")
        let loc = URLQueryItem(name:"location", value: "\(params.latitude),\(params.longitude)")
        
        var components = URLComponents(url: endpoint, resolvingAgainstBaseURL: false)
        components?.queryItems = [key, keywords, rankby, loc];
        
        guard let url = try! components?.asURL() else {
            Shared.log.error("Could not create url")
            error?()
            return
        }
    
        let request : URLRequest = URLRequest(url: url)
        
        Shared.log.info("Begin Requesting Nearby Locations")
        Shared.log.debug("\(request)")
    
        AF.request(request).validate().responseDecodable(of: GooglePlacesNearbyQueryResult.self) { response in
              Shared.log.trace("Response: \(response)")
               guard let items = response.value else {
                    error?()
                    return
                }
               success?(items)
            }
        }
}
