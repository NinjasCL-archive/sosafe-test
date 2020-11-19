// Based on https://app.quicktype.io/

import Foundation
import CoreLocation
import Shared

// MARK: - GooglePlacesNearbyQueryResult
public struct GooglePlacesNearbyQueryResult: Codable {
    public let htmlAttributions: [JSONAny]?
    public let nextPageToken: String?
    public let results: [GooglePlacesNearbyQueryPlace]?
    public let status: String?

    enum CodingKeys: String, CodingKey {
        case htmlAttributions = "html_attributions"
        case nextPageToken = "next_page_token"
        case results, status
    }
}

// MARK: - Result
public struct GooglePlacesNearbyQueryPlace: Codable {
    public let businessStatus: BusinessStatus?
    public let geometry: Geometry?
    public let icon: String?
    public let name: String?
    public let openingHours: OpeningHours?
    public let photos: [Photo]?
    public let placeID: String?
    public let plusCode: PlusCode?
    public let rating: Double?
    public let reference: String?
    public let scope: Scope?
    public let types: [TypeElement]?
    public let userRatingsTotal: Int?
    public let vicinity: String?
    
    public var uid: String {
        return "\(String(describing: self.placeID))\(String(describing: self.name))\(self.location.latitude)\(self.location.longitude)"
    }
    
    public var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.geometry?.location?.lat ?? 0, longitude: self.geometry?.location?.lng ?? 0)
    }
    
    public var json: String {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(self)
        return String(data: data!, encoding: .utf8)!
    }
    
    public static func from(json:String) -> GooglePlacesNearbyQueryPlace? {
        let decoder = JSONDecoder()
        let data = json.data(using: .utf8)!
        return try? decoder.decode(GooglePlacesNearbyQueryPlace.self, from: data)
    }

    enum CodingKeys: String, CodingKey {
        case businessStatus = "business_status"
        case geometry, icon, name
        case openingHours = "opening_hours"
        case photos
        case placeID = "place_id"
        case plusCode = "plus_code"
        case rating, reference, scope, types
        case userRatingsTotal = "user_ratings_total"
        case vicinity
    }
}

public enum BusinessStatus: String, Codable {
    case operational = "OPERATIONAL"
}

// MARK: - Geometry
public struct Geometry: Codable {
    public let location: Location?
    public let viewport: Viewport?
}

// MARK: - Location
public struct Location: Codable {
    public let lat, lng: Double?
}

// MARK: - Viewport
public struct Viewport: Codable {
    public let northeast, southwest: Location?
}

// MARK: - OpeningHours
public struct OpeningHours: Codable {
    public let openNow: Bool?

    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
    }
}

// MARK: - Photo
public struct Photo: Codable {
    public let height: Int?
    public let htmlAttributions: [String]?
    public let photoReference: String?
    public let width: Int?

    enum CodingKeys: String, CodingKey {
        case height
        case htmlAttributions = "html_attributions"
        case photoReference = "photo_reference"
        case width
    }
}

// MARK: - PlusCode
public struct PlusCode: Codable {
    public let compoundCode, globalCode: String?

    enum CodingKeys: String, CodingKey {
        case compoundCode = "compound_code"
        case globalCode = "global_code"
    }
}

public enum Scope: String, Codable {
    case google = "GOOGLE"
}

// https://developers.google.com/places/supported_types
public enum TypeElement: String, Codable {
    case accounting = "accounting"
    case airport = "airport"
    case amusementPark = "amusement_park"
    case aquarium = "aquarium"
    case artGallery = "art_gallery"
    case atm = "atm"
    case bakery = "bakery"
    case bank = "bank"
    case bar = "bar"
    case beautySalon = "beauty_salon"
    case bicycle_store = "bicycle_store"
    case book_store = "book_store"
    case bowlingAlley = "bowling_alley"
    case bus_station = "bus_station"
    case cafe = "cafe"
    case campground = "campground"
    case carDealer = "car_dealer"
    case carRental = "car_rental"
    case carRepair = "car_repair"
    case carWash = "car_wash"
    case casino = "casino"
    case cemetery = "cemetery"
    case church = "church"
    case cityHall = "city_hall"
    case clothingStore = "clothing_store"
    case convenienceStore = "convenience_store"
    case courthouse = "courthouse"
    case dentist = "dentist"
    case departmentStore = "department_store"
    case doctor = "doctor"
    case drugstore = "drugstore"
    case electrician = "electrician"
    case electronicsStore = "electronics_store"
    case embassy = "embassy"
    case fireStation = "fire_station"
    case florist = "florist"
    case funeralHome = "funeral_home"
    case furnitureStore = "furniture_store"
    case gasStation = "gas_station"
    case gym = "gym"
    case groceryOrSupermarket = "grocery_or_supermarket"
    case hairCare = "hair_care"
    case hardwareStore = "hardware_store"
    case hinduTemple = "hindu_temple"
    case homeGoodsStore = "home_goods_store"
    case hospital = "hospital"
    case insuranceAgency = "insurance_agency"
    case jewelryStore = "jewelry_store"
    case laundry = "laundry"
    case lawyer = "lawyer"
    case library = "library"
    case lightRailStation = "light_rail_station"
    case liquorStore = "liquor_store"
    case localGovernmentOffice = "local_government_office"
    case locksmith = "locksmith"
    case lodging = "lodging"
    case mealDelivery = "meal_delivery"
    case mealTakeaway = "meal_takeaway"
    case mosque = "mosque"
    case movieRental = "movie_rental"
    case movieTheater = "movie_theater"
    case movingCompany = "moving_company"
    case museum = "museum"
    case nightClub = "night_club"
    case painter = "painter"
    case park = "park"
    case parking = "parking"
    case petStore = "pet_store"
    case pharmacy = "pharmacy"
    case physiotherapist = "physiotherapist"
    case plumber = "plumber"
    case police = "police"
    case postOffice = "post_office"
    case primarySchool = "primary_school"
    case realEstateAgency = "real_estate_agency"
    case restaurant = "restaurant"
    case roofingContractor = "roofing_contractor"
    case rvPark = "rv_park"
    case school = "school"
    case secondarySchool = "secondary_school"
    case shoeStore = "shoe_store"
    case shoppingMall = "shopping_mall"
    case spa = "spa"
    case stadium = "stadium"
    case storage = "storage"
    case store = "store"
    case subwayStation = "subway_station"
    case supermarket = "supermarket"
    case synagogue = "synagogue"
    case taxiStand = "taxi_stand"
    case touristAttraction = "tourist_attraction"
    case trainStation = "train_station"
    case transitStation = "transit_station"
    case travelAgency = "travel_agency"
    case university = "university"
    case veterinaryCare = "veterinary_care"
    case zoo = "zoo"

    case administrativeAreaLevel1 = "administrative_area_level_1"
    case administrativeAreaLevel2 = "administrative_area_level_2"
    case administrativeAreaLevel3 = "administrative_area_level_3"
    case administrativeAreaLevel4 = "administrative_area_level_4"
    case administrativeAreaLevel5 = "administrative_area_level_5"
    case archipelago = "archipelago"
    case colloquialArea = "colloquial_area"
    case continent = "continent"
    case country = "country"
    case establishment = "establishment"
    case finance = "finance"
    case floor = "floor"
    case food = "food"
    case generalContractor = "general_contractor"
    case geocode = "geocode"
    case health = "health"
    case intersection = "intersection"
    case locality = "locality"
    case naturalFeature = "natural_feature"
    case neighborhood = "neighborhood"
    case placeOfWorship = "place_of_worship"

    case plusCode = "plus_code"
    case pointOfInterest = "point_of_interest"
    case political = "political"
    case postBox = "post_box"
    case postalCode = "postal_code"
    case postalCodePrefix = "postal_code_prefix"
    case postalCodeSuffix = "postal_code_suffix"
    case postalTown = "postal_town"
    case premise = "premise"
    case room = "room"
    case route = "route"
    case streetAddress = "street_address"
    case streetNumber = "street_number"
    case sublocality = "sublocality"
    case sublocalityLevel1 = "sublocality_level_1"
    case sublocalityLevel2 = "sublocality_level_2"
    case sublocalityLevel3 = "sublocality_level_3"
    case sublocalityLevel4 = "sublocality_level_4"
    case sublocalityLevel5 = "sublocality_level_5"
    case subpremise = "subpremise"
    case townSquare = "town_square"
    
    case unknown = "unknown"
    
    init(value: String) {
        if let type = TypeElement(rawValue: value) {
            self = type
        } else {
            Shared.log.warning("No TypeElement found for \(value)")
            self = .unknown
        }
    }
}

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

public class JSONCodingKey: CodingKey {
    let key: String

    public required init?(intValue: Int) {
        return nil
    }

    public required init?(stringValue: String) {
        key = stringValue
    }

    public var intValue: Int? {
        return nil
    }

    public var stringValue: String {
        return key
    }
}

public class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
