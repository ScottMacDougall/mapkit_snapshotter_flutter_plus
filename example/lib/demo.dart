import 'package:flutter/material.dart';
import 'package:mapkit_snapshotter_flutter_plus/mapkit_snapshotter_flutter_plus.dart';

class DemoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MapKit Snapshotter'),
      ),
      body: Builder(builder: (context) {
        final mq = MediaQuery.of(context);

        return Container(
          child: Image(
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
            height: mq.size.height - 76,
            width: mq.size.width,
          ),
        );
      }),
    );
  }
}
