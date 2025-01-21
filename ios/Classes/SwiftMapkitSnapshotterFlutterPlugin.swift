import Flutter
import UIKit
import MapKit

public class SwiftMapkitSnapshotterFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mapkit_snapshotter_flutter_plus", binaryMessenger: registrar.messenger())
    let instance = SwiftMapkitSnapshotterFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "capture") {
        do {
            /// Load the given arguments for the method call.
                        guard let baseArguments = call.arguments as? Dictionary<String, Any> else {
                            throw NSError(domain: "InvalidArguments", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid arguments"])
                        }
                        
                        /// Decode the arguments.
                        guard let decodedData = MapKitSnapshotterDecoder.decodeData(arguments: baseArguments) else {
                            throw NSError(domain: "DecodingError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to decode arguments"])
                        }

                        /// Build the snapshotter based on the decoded data.
                        let snapShotter = MKMapSnapshotter(options: decodedData.options)
                        
                        snapShotter.start(completionHandler: { snapshot, error in
                            if let error = error {
                                result(FlutterError(code: "SnapshotError", message: error.localizedDescription, details: nil))
                            } else if let imageData = snapshot?.image.pngData() {
                                result(imageData)
                            } else {
                                result(nil)
                            }
                        })
        } catch let error as NSError {
                    result(FlutterError(code: "\(error.domain)", message: error.localizedDescription, details: nil))
                }
    } else {
        result(FlutterMethodNotImplemented)
    }
  }
}

