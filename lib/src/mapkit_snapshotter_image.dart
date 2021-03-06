import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:mapkit_snapshotter_flutter/src/mapkit_snapshotter_types.dart';

/// Provides the MapKit Snapshow based on the given [options].
///
/// Usage:
/// ```dart
/// final widget = Image(
///   image: MapKitSnapshotterImage(
///     MapKitSnapshotterOptions(
///       /// Defines the region to capture.
///       region: MapKitSnapshotterRegion(
///         centerLatitude: 53.552363,
///         centerLongitude: 9.990831,
///         latitudeMeters: 2000,
///         longitudeMeters: 2000,
///       ),
///       /// Additional properties for the snapshot.
///       brightness: MapKitSnapshotterBrightness.light,
///       mapType: MapKitSnapshotterMapType.hybridFlyover,
///     ),
///   ),
///   height: 100,
///   width: 100,
/// );
/// ```
class MapKitSnapshotterImage
    extends ImageProvider<MapKitSnapshotterImageProviderKey> {
  static const MethodChannel _channel =
      MethodChannel('mapkit_snapshotter_flutter');

  /// Defines the options for the capture. This is required as it contains
  /// information about the region to capture.
  final MapKitSnapshotterOptions options;

  MapKitSnapshotterImage(this.options);

  @override
  ImageStreamCompleter load(MapKitSnapshotterImageProviderKey key, decode) {
    return OneFrameImageStreamCompleter(Future(() async {
      // Capture the screenshot on the iOS native side.
      final captureResponse = await _channel.invokeMethod(
        'capture',
        key.toJson(),
      );

      // Return null if the response si null.
      if (captureResponse == null) {
        throw StateError('Failed to take snapshot');
      }

      final desc = await ui.ImageDescriptor.encoded(
        await ui.ImmutableBuffer.fromUint8List(captureResponse),
      );

      final codec = await desc.instantiateCodec();
      final frame = await codec.getNextFrame();
      final image = frame.image;

      return ImageInfo(
        image: image,
        scale: key.devicePixelRatio,
      );
    }));
  }

  @override
  Future<MapKitSnapshotterImageProviderKey> obtainKey(
    ImageConfiguration configuration,
  ) {
    // The configuration does not always provide all values, therefore we need
    // to define some defaults.
    return Future.value(MapKitSnapshotterImageProviderKey(
      sizeHeight: configuration.size?.height ?? 400,
      sizeWidth: configuration.size?.width ?? 400,
      devicePixelRatio: configuration.devicePixelRatio ?? 1,
      options: options,
    ));
  }
}
