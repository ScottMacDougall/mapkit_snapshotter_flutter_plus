// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapkit_snapshotter_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapKitSnapshotterOptions _$MapKitSnapshotterOptionsFromJson(
        Map<String, dynamic> json) =>
    MapKitSnapshotterOptions(
      region: MapKitSnapshotterRegion.fromJson(
          json['region'] as Map<String, dynamic>),
      mapType: $enumDecodeNullable(
          _$MapKitSnapshotterMapTypeEnumMap, json['mapType']),
      brightness: $enumDecodeNullable(
          _$MapKitSnapshotterBrightnessEnumMap, json['brightness']),
      showsBuildings: json['showsBuildings'] as bool?,
      showsPointsOfInterest: json['showsPointsOfInterest'] as bool?,
    );

Map<String, dynamic> _$MapKitSnapshotterOptionsToJson(
    MapKitSnapshotterOptions instance) {
  final val = <String, dynamic>{
    'region': instance.region.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'mapType', MapKitSnapshotterOptions._mapTypeToJson(instance.mapType));
  writeNotNull('brightness',
      MapKitSnapshotterOptions._brightnessToJson(instance.brightness));
  writeNotNull('showsBuildings', instance.showsBuildings);
  writeNotNull('showsPointsOfInterest', instance.showsPointsOfInterest);
  return val;
}

const _$MapKitSnapshotterMapTypeEnumMap = {
  MapKitSnapshotterMapType.standard: 'standard',
  MapKitSnapshotterMapType.satellite: 'satellite',
  MapKitSnapshotterMapType.hybrid: 'hybrid',
  MapKitSnapshotterMapType.satelliteFlyover: 'satelliteFlyover',
  MapKitSnapshotterMapType.hybridFlyover: 'hybridFlyover',
  MapKitSnapshotterMapType.mutedStandard: 'mutedStandard',
};

const _$MapKitSnapshotterBrightnessEnumMap = {
  MapKitSnapshotterBrightness.light: 'light',
  MapKitSnapshotterBrightness.dark: 'dark',
};

MapKitSnapshotterRegion _$MapKitSnapshotterRegionFromJson(
        Map<String, dynamic> json) =>
    MapKitSnapshotterRegion(
      centerLatitude: (json['centerLatitude'] as num).toDouble(),
      centerLongitude: (json['centerLongitude'] as num).toDouble(),
      latitudeMeters: (json['latitudeMeters'] as num).toDouble(),
      longitudeMeters: (json['longitudeMeters'] as num).toDouble(),
    );

Map<String, dynamic> _$MapKitSnapshotterRegionToJson(
        MapKitSnapshotterRegion instance) =>
    <String, dynamic>{
      'centerLatitude': instance.centerLatitude,
      'centerLongitude': instance.centerLongitude,
      'latitudeMeters': instance.latitudeMeters,
      'longitudeMeters': instance.longitudeMeters,
    };

MapKitSnapshotterImageProviderKey _$MapKitSnapshotterImageProviderKeyFromJson(
        Map<String, dynamic> json) =>
    MapKitSnapshotterImageProviderKey(
      sizeHeight: (json['sizeHeight'] as num).toDouble(),
      sizeWidth: (json['sizeWidth'] as num).toDouble(),
      options: MapKitSnapshotterOptions.fromJson(
          json['options'] as Map<String, dynamic>),
      devicePixelRatio: (json['devicePixelRatio'] as num).toDouble(),
    );

Map<String, dynamic> _$MapKitSnapshotterImageProviderKeyToJson(
        MapKitSnapshotterImageProviderKey instance) =>
    <String, dynamic>{
      'sizeHeight': instance.sizeHeight,
      'sizeWidth': instance.sizeWidth,
      'devicePixelRatio': instance.devicePixelRatio,
      'options': instance.options.toJson(),
    };
