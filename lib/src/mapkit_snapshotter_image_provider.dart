import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:mapkit_snapshotter_flutter/src/mapkit_snapshotter_types.dart';

class MapKitSnapshotterImageProvider
    extends ImageProvider<MapKitSnapshotterImageProviderKey> {
  static const MethodChannel _channel =
      const MethodChannel('mapkit_snapshotter_flutter');

  /// Defines the options for the capture. This is required as it contains
  /// information about the region to capture.
  final MapKitSnapshotterOptions options;

  MapKitSnapshotterImageProvider(this.options) : assert(options != null);

  @override
  ImageStreamCompleter load(MapKitSnapshotterImageProviderKey key, decode) {
    return OneFrameImageStreamCompleter(Future(() async {
      final t = await _channel.invokeMethod('capture', key.toJson());

      final buffer = await ui.ImmutableBuffer.fromUint8List(t);

      final desc = await ui.ImageDescriptor.encoded(buffer);

      final codec = await desc.instantiateCodec();
      final image = (await codec.getNextFrame()).image;

      return ImageInfo(image: image);
    }));
  }

  @override
  Future<MapKitSnapshotterImageProviderKey> obtainKey(
    ImageConfiguration configuration,
  ) {
    return Future.value(MapKitSnapshotterImageProviderKey(
      sizeHeight: configuration.size.height,
      sizeWidth: configuration.size.width,
      options: options,
      devicePixelRatio: configuration.devicePixelRatio,
    ));
  }
}
