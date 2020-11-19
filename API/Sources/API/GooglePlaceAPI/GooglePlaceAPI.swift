import Shared

public final class GooglePlaceAPI {
    public static let shared = GooglePlaceAPI()
    
    public func nearby(_ params: GooglePlacesNearbyQuerySearchParams, success: GooglePlaceAPINearbySearchResultSuccessHandler? = nil, error: (() -> Void)? = nil) {
        Shared.log.trace("GooglePlaceAPI nearby func triggered")
        GooglePlaceAPINearby.search(params, success: success, error: error)
    }
    
}
