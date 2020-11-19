# API

A simple API to call different services.

## Google Place


```swift
// Search for tenis in Santiago
let params = API.GooglePlacesNearbyQuerySearchParams("Tenis", latitude: -33.4594048, longitude: -70.6576384)

 API.Google.place.nearby(params, success: { (response) in
    // response.results
 }, error: {
    // error calling the api 
 })
```
