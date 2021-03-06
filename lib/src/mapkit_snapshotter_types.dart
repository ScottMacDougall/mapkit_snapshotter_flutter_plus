import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mapkit_snapshotter_types.g.dart';

/// Defines options for the map capturing. This requires [region] to be present.
/// All other properties are optional and have sane defaults.
@immutable
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class MapKitSnapshotterOptions {
  /// Defines the visible region on the capture.
  final MapKitSnapshotterRegion region;

  /// Defines the map type for the capture.
  /// By default [MapKitSnapshotterMapType.standard] will be used.
  @JsonKey(toJson: _mapTypeToJson)
  final MapKitSnapshotterMapType? mapType;

  /// Defines the brightness of the map for the capture.
  /// By default the current system default is used.
  @JsonKey(toJson: _brightnessToJson)
  final MapKitSnapshotterBrightness? brightness;

  /// If buildings shall be show on the capture.
  final bool? showsBuildings;

  /// If POIs shall be shown on the capture.
  final bool? showsPointsOfInterest;

  MapKitSnapshotterOptions({
    required this.region,
    this.mapType,
    this.brightness,
    this.showsBuildings,
    this.showsPointsOfInterest,
  });

  factory MapKitSnapshotterOptions.fromJson(Map<String, dynamic> json) =>
      _$MapKitSnapshotterOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$MapKitSnapshotterOptionsToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MapKitSnapshotterOptions &&
          runtimeType == other.runtimeType &&
          region == other.region &&
          mapType == other.mapType &&
          brightness == other.brightness &&
          showsBuildings == other.showsBuildings &&
          showsPointsOfInterest == other.showsPointsOfInterest;

  @override
  int get hashCode =>
      region.hashCode ^
      mapType.hashCode ^
      brightness.hashCode ^
      showsBuildings.hashCode ^
      showsPointsOfInterest.hashCode;

  @override
  String toString() {
    return 'MapKitSnapshotterOptions{'
        'region: $region, '
        'mapType: $mapType, '
        'brightness: $brightness, '
        'showsBuildings: $showsBuildings, '
        'showsPointsOfInterest: $showsPointsOfInterest}';
  }

  /// Will encode the given value to the json representation.
  static int? _brightnessToJson(MapKitSnapshotterBrightness? brightness) {
    return brightness?.index;
  }

  /// Will encode the given value to the json representation.
  static int? _mapTypeToJson(MapKitSnapshotterMapType? mapType) {
    return mapType?.index;
  }
}

/// Defines the type of the captured map. Some values may not be available
/// on certain iOS versions (see below).
enum MapKitSnapshotterMapType {
  standard, // = 0

  satellite, //  = 1

  hybrid, //  = 2

  /// Available iOS 9.0 and updwards.
  satelliteFlyover, // = 3

  /// Available iOS 9.0 and upwards.
  hybridFlyover, //  = 4

  /// Available iOS 11.0 and upwards.
  mutedStandard, //  = 5
}

/// Defines the brightness of the map. This can either be dark or light.
enum MapKitSnapshotterBrightness {
  light, // = 0
  dark, // = 1
}

/// Defines the region to capture. This contains the center and the latitude
/// and longitude meters to dispaly.
@immutable
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class MapKitSnapshotterRegion {
  final double centerLatitude;
  final double centerLongitude;

  final double latitudeMeters;
  final double longitudeMeters;

  MapKitSnapshotterRegion({
    required this.centerLatitude,
    required this.centerLongitude,
    required this.latitudeMeters,
    required this.longitudeMeters,
  });

  factory MapKitSnapshotterRegion.fromJson(Map<String, dynamic> json) =>
      _$MapKitSnapshotterRegionFromJson(json);

  Map<String, dynamic> toJson() => _$MapKitSnapshotterRegionToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MapKitSnapshotterRegion &&
          runtimeType == other.runtimeType &&
          centerLatitude == other.centerLatitude &&
          centerLongitude == other.centerLongitude &&
          latitudeMeters == other.latitudeMeters &&
          longitudeMeters == other.longitudeMeters;

  @override
  int get hashCode =>
      centerLatitude.hashCode ^
      centerLongitude.hashCode ^
      latitudeMeters.hashCode ^
      longitudeMeters.hashCode;

  @override
  String toString() {
    return 'MapKitSnapshotterRegion{'
        'centerLatitude: $centerLatitude, '
        'centerLongitude: $centerLongitude, '
        'latitudeMeters: $latitudeMeters, '
        'longitudeMeters: $longitudeMeters}';
  }
}

@immutable
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class MapKitSnapshotterImageProviderKey {
  final double sizeHeight;
  final double sizeWidth;
  final double devicePixelRatio;
  final MapKitSnapshotterOptions options;

  MapKitSnapshotterImageProviderKey({
    required this.sizeHeight,
    required this.sizeWidth,
    required this.options,
    required this.devicePixelRatio,
  });

  factory MapKitSnapshotterImageProviderKey.fromJson(
          Map<String, dynamic> json) =>
      _$MapKitSnapshotterImageProviderKeyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MapKitSnapshotterImageProviderKeyToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MapKitSnapshotterImageProviderKey &&
          runtimeType == other.runtimeType &&
          sizeHeight == other.sizeHeight &&
          sizeWidth == other.sizeWidth &&
          devicePixelRatio == other.devicePixelRatio &&
          options == other.options;

  @override
  int get hashCode =>
      sizeHeight.hashCode ^
      sizeWidth.hashCode ^
      devicePixelRatio.hashCode ^
      options.hashCode;

  @override
  String toString() {
    return 'MapKitSnapshotterImageProviderKey{'
        'sizeHeight: $sizeHeight, '
        'sizeWidth: $sizeWidth, '
        'devicePixelRatio: $devicePixelRatio, '
        'options: $options}';
  }
}
