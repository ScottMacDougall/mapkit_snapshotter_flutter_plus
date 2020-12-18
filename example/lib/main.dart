import 'package:flutter/material.dart';
import 'package:mapkit_snapshotter_flutter/mapkit_snapshotter_flutter.dart';
import 'package:mapkit_snapshotter_flutter_example/demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MapKitSnapshotterBrightness brightness = MapKitSnapshotterBrightness.light;
  int mapType = 0;
  bool showsBuildings = false;
  bool showsPointsOfIntereset = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MapKit Snapshotter example'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Image(
                image: MapKitSnapshotterImage(
                  MapKitSnapshotterOptions(
                    region: MapKitSnapshotterRegion(
                      centerLatitude: 53.552363,
                      centerLongitude: 9.990831,
                      latitudeMeters: 1000,
                      longitudeMeters: 1000,
                    ),
                    brightness: brightness,
                    mapType: MapKitSnapshotterMapType.values[mapType],
                    showsBuildings: showsBuildings,
                    showsPointsOfInterest: showsPointsOfIntereset,
                  ),
                ),
                width: 350,
                height: 200,
              ),
              Column(
                children: [
                  Text('Brightness: ${brightness.toString()}'),
                  Text('Map type: ${MapKitSnapshotterMapType.values[mapType]}'),
                ],
              ),
              Column(
                children: [
                  MaterialButton(
                    child: Text('Toogle brightness'),
                    onPressed: () {
                      setState(() {
                        var brightness = MapKitSnapshotterBrightness.light;
                        if (this.brightness ==
                            MapKitSnapshotterBrightness.light) {
                          brightness = MapKitSnapshotterBrightness.dark;
                        }

                        this.brightness = brightness;
                      });
                    },
                  ),
                  MaterialButton(
                    child: Text('Switch MapType'),
                    onPressed: () {
                      setState(() {
                        mapType++;
                        if (mapType >= MapKitSnapshotterMapType.values.length) {
                          mapType = 0;
                        }
                      });
                    },
                  ),
                  MaterialButton(
                    child:
                        Text('${showsBuildings ? 'Hide' : 'Show'} buildings'),
                    onPressed: () {
                      setState(() {
                        showsBuildings = !showsBuildings;
                      });
                    },
                  ),
                  MaterialButton(
                    child: Text(
                        '${showsPointsOfIntereset ? 'Hide' : 'Show'} points of intereset'),
                    onPressed: () {
                      setState(() {
                        showsPointsOfIntereset = !showsPointsOfIntereset;
                      });
                    },
                  ),
                  Builder(
                    builder: (context) {
                      return MaterialButton(
                        child: Text('Open demo'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DemoRoute()));
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
