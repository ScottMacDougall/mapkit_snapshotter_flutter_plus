import Flutter
import UIKit
import MapKit

public class SwiftMapkitSnapshotterFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mapkit_snapshotter_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftMapkitSnapshotterFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "capture") {
        /// Load the given arguments for the method call.
        let baseArguments = call.arguments as! Dictionary<String, Any>
        
        /// Decode the arguments.
        let decodedData = MapKitSnapshotterDecoder.decodeData(arguments: baseArguments)

        /// Build the snapshotter based on the decoded data.
        let snapShotter = MKMapSnapshotter(options: decodedData!.options)
        
        snapShotter.start(completionHandler: {snapshot, error in
            if (error != nil) {
                result(error)
            } else {
                result(snapshot?.image.pngData())
            }
        });
    } else {
        result(FlutterMethodNotImplemented)
    }
  }
}

