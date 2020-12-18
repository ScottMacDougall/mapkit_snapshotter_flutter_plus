import 'package:flutter/material.dart';
import 'package:mapkit_snapshotter_flutter/mapkit_snapshotter_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Image(
            image: MapKitSnapshotterImageProvider(
              MapKitSnapshotterOptions(
                region: MapKitSnapshotterRegion(
                  centerLatitude: 48.593946,
                  centerLongitude: 12.208799,
                  latitudeMeters: 1000,
                  longitudeMeters: 1000,
                ),
              ),
            ),
            width: 350,
            height: 200,
          ),
        ),
      ),
    );
  }
}
