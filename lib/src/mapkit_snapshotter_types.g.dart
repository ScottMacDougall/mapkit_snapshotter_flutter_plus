// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapkit_snapshotter_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapKitSnapshotterOptions _$MapKitSnapshotterOptionsFromJson(
    Map<String, dynamic> json) {
  return MapKitSnapshotterOptions(
    region: json['region'] == null
        ? null
        : MapKitSnapshotterRegion.fromJson(
            json['region'] as Map<String, dynamic>),
    mapType: _$enumDecodeNullable(
        _$MapKitSnapshotterMapTypeEnumMap, json['mapType']),
    brightness: _$enumDecodeNullable(
        _$MapKitSnapshotterBrightnessEnumMap, json['brightness']),
    showsBuildings: json['showsBuildings'] as bool,
    showsPointsOfInterest: json['showsPointsOfInterest'] as bool,
  );
}

Map<String, dynamic> _$MapKitSnapshotterOptionsToJson(
    MapKitSnapshotterOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('region', instance.region?.toJson());
  writeNotNull(
      'mapType', MapKitSnapshotterOptions._mapTypeToJson(instance.mapType));
  writeNotNull('brightness',
      MapKitSnapshotterOptions._brightnessToJson(instance.brightness));
  writeNotNull('showsBuildings', instance.showsBuildings);
  writeNotNull('showsPointsOfInterest', instance.showsPointsOfInterest);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
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
    Map<String, dynamic> json) {
  return MapKitSnapshotterRegion(
    centerLatitude: (json['centerLatitude'] as num)?.toDouble(),
    centerLongitude: (json['centerLongitude'] as num)?.toDouble(),
    latitudeMeters: (json['latitudeMeters'] as num)?.toDouble(),
    longitudeMeters: (json['longitudeMeters'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MapKitSnapshotterRegionToJson(
    MapKitSnapshotterRegion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('centerLatitude', instance.centerLatitude);
  writeNotNull('centerLongitude', instance.centerLongitude);
  writeNotNull('latitudeMeters', instance.latitudeMeters);
  writeNotNull('longitudeMeters', instance.longitudeMeters);
  return val;
}

MapKitSnapshotterImageProviderKey _$MapKitSnapshotterImageProviderKeyFromJson(
    Map<String, dynamic> json) {
  return MapKitSnapshotterImageProviderKey(
    sizeHeight: (json['sizeHeight'] as num)?.toDouble(),
    sizeWidth: (json['sizeWidth'] as num)?.toDouble(),
    options: json['options'] == null
        ? null
        : MapKitSnapshotterOptions.fromJson(
            json['options'] as Map<String, dynamic>),
    devicePixelRatio: (json['devicePixelRatio'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MapKitSnapshotterImageProviderKeyToJson(
    MapKitSnapshotterImageProviderKey instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sizeHeight', instance.sizeHeight);
  writeNotNull('sizeWidth', instance.sizeWidth);
  writeNotNull('devicePixelRatio', instance.devicePixelRatio);
  writeNotNull('options', instance.options?.toJson());
  return val;
}
