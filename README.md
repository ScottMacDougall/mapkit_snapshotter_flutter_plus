# MapKit Snapshotter

A Flutter plugin which provides
the [MKMapScreenshoter](https://developer.apple.com/documentation/mapkit/mkmapsnapshotter). This integrates with the
default [Image](https://api.flutter.dev/flutter/widgets/Image-class.html) Widget of Flutter.

## Screenshots

| Example 1 (Standard) | Example 2 (Hybrid) |
| --- | --- |
| ![](docs/images/demo_screenshot_1.png "MapKit Snapshotter example with standard map type") | ![](docs/images/demo_screenshot_2.png "MapKit Snapshotter example with hybrid map type") |

## Usage

**This plugin is only available on iOS as it uses the MapKit SDK.**

Usage example:

```dart
final widget = Image(
  image: MapKitSnapshotterImage(
    MapKitSnapshotterOptions(
      region: MapKitSnapshotterRegion(
        centerLatitude: 53.552363,
        centerLongitude: 9.990831,
        latitudeMeters: 2000,
        longitudeMeters: 2000,
      ),
      brightness: MapKitSnapshotterBrightness.light,
      mapType: MapKitSnapshotterMapType.hybridFlyover,
    ),
  ),
  height: 100,
  width: 100,
);

/// ... Use your widget
```
