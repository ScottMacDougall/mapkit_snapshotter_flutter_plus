//
//  MapKitSnapshotterUtils.swift
//  mapkit_snapshotter_flutter
//
//  Created by Andre Loreth on 18.12.20.
//

import Foundation
import MapKit

class MapKitSnapshotterDecoder {
    // Dictionary keys for the snapshotter key.
    private static let kSizeHeightKey = "sizeHeight"
    private static let kSizeWidthKey = "sizeWidth"
    private static let kDevicePixelRatio = "devicePixelRatio"
    private static let kOptions = "options"
    
    // Dictionary keys for the options.
    private static let kRegion = "region"
    private static let kMapType = "mapType"
    private static let kBrightness = "brightness"
    private static let kShowsBuildings = "showsBuildings"
    private static let kShowsPointsOfInterest = "showsPointsOfInterest"
    
    // Dictionary keys for the region.
    private static let kCenterLatitude = "centerLatitude"
    private static let kCenterLongitude = "centerLongitude"
    private static let kLatitudeMeters = "latitudeMeters"
    private static let kLongitudeMeters = "longitudeMeters"
    
    static public func decodeData(arguments: Dictionary<String, Any>) -> MapKitSnapshotterDecoder.Data? {
        guard let sizeHeight = arguments[MapKitSnapshotterDecoder.kSizeHeightKey] as? Double else {
            return nil
        }
        
        guard let sizeWidth = arguments[MapKitSnapshotterDecoder.kSizeWidthKey] as? Double else {
            return nil
        }
        
        guard let devicePixelRatio = arguments[MapKitSnapshotterDecoder.kDevicePixelRatio] as? Double else {
            return nil
        }
        
        guard let optionsValue = arguments[MapKitSnapshotterDecoder.kOptions] as? Dictionary<String, Any> else {
            return nil
        }
        
        let options = decodeSnapshotterOptions(arguments: optionsValue,
                                               size: CGSize(width: sizeWidth, height: sizeHeight),
                                               devicePixelRatio: devicePixelRatio)
        
        return MapKitSnapshotterDecoder.Data(options: options)
    }
    
    static public func decodeSnapshotterOptions(arguments: Dictionary<String, Any>, size: CGSize, devicePixelRatio: Double) -> MKMapSnapshotter.Options {
        let options = MKMapSnapshotter.Options()
        
        if let regionValue = arguments[kRegion] as? Dictionary<String, Any> {
            let region = decodeRegion(arguments: regionValue)
            if (region != nil) {
                options.region = region!
            }
        }
        
        options.size = size
        options.scale = CGFloat(devicePixelRatio)
        
        if #available(iOS 13.0, *) {
            if let traitCollection = decodeTraitCollection(optionsArguments: arguments) {
                options.traitCollection = traitCollection
            }
        }
        
        if let mapType = decodeMapType(optionsArguments: arguments) {
            options.mapType = mapType
        }
        
        if let showsBuildings = decodeBoolean(arguments: arguments, key: kShowsBuildings) {
            options.showsBuildings = showsBuildings
        }
        
        if let showsPointsOfInterest = decodeBoolean(arguments: arguments, key: kShowsPointsOfInterest) {
            options.showsPointsOfInterest = showsPointsOfInterest
        }
        
        return options
    }
    
    /// Will decode the region from the given arguments dictionary. If any required property ismissing, nil will be returned.
    /// If all required values exist on the dictionary, a MKCoordinateRegion instance will be returned.
    static private func decodeRegion(arguments: Dictionary<String, Any>) -> MKCoordinateRegion? {
        guard let centerLatitude = arguments[kCenterLatitude] as? Double else {
            return nil
        }
        
        guard let centerLongitude = arguments[kCenterLongitude] as? Double else {
            return nil
        }
        
        guard let latitudeMeters = arguments[kLatitudeMeters] as? Double else {
            return nil
        }
        
        guard let longitudeMeters = arguments[kLongitudeMeters] as? Double else {
            return nil
        }
        
        let center = CLLocationCoordinate2D(latitude: centerLatitude, longitude: centerLongitude)
        
        return MKCoordinateRegion(center: center,
                                  latitudinalMeters: latitudeMeters,
                                  longitudinalMeters: longitudeMeters)
    }
    
    /// Will decode the brightness within the given arguments dictionary. If the key was not found on the dictionary, nill will be returned.
    /// If the value exists on the dictionary, the brightness value will be interpreted as UITraitCollection.
    @available(iOS 12.0, *)
    static private func decodeTraitCollection (optionsArguments: Dictionary<String, Any>) -> UITraitCollection? {
        if let brightness = optionsArguments[kBrightness] as? Int {
            var style: UIUserInterfaceStyle = UIUserInterfaceStyle.unspecified
            if (brightness == 0) {
                style = UIUserInterfaceStyle.light
            } else if (brightness == 1) {
                style = UIUserInterfaceStyle.dark
            }
            
            return UITraitCollection(userInterfaceStyle: style)
        }
        
        return nil
    }
    
    /// Will decode the MapType from the given arguments dictionary. If the key does not exist on the dictionary, nil will be returned.
    /// If the values exists on the dictionary, it will be interpreted and the appropriate MKMapType will be returned.
    /// - Parameter optionsArguments: The arguments dictionary which holds the mapType key
    /// - Returns: The MKMapType or nil if not found on the dictionary.
    static private func decodeMapType(optionsArguments: Dictionary<String, Any>) -> MKMapType? {
        if let mapTypeValue = optionsArguments[kMapType] as? Int {
            var mapType: MKMapType = .standard
            if (mapTypeValue == 1) {
                mapType = .satellite
            } else if (mapTypeValue == 2) {
                mapType = .hybrid
            } else if (mapTypeValue == 3) {
                mapType = .satelliteFlyover
            } else if (mapTypeValue == 4) {
                mapType = .hybridFlyover
            } else if (mapTypeValue == 5) {
                if #available(iOS 11.0, *) {
                    mapType = .mutedStandard
                }
            }
            
            return mapType
        }
        
        return nil
    }
    
    /// Will decode a boolean value on the given arguments dictionary with the given key. If the key does not exist on the dictionary, nil will be returned.
    /// If the value was found and is a boolean, the actual value will be returned
    /// - Parameters:
    ///   - arguments: The dictionary which holds all options
    ///   - key: The key to search for in the arguments dictionary.
    /// - Returns: The boolean value of nil if the key was not found on the dictionary.
    static private func decodeBoolean (arguments: Dictionary<String, Any>, key: String) -> Bool? {
        guard let value = arguments[key] as? Bool else {
            return nil
        }
        
        return value
    }
    
    /// Defines the data of the base argument.
    public struct Data {
        public let options: MKMapSnapshotter.Options
    }
}
