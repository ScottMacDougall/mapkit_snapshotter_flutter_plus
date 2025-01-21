#import "MapkitSnapshotterFlutterPlugin.h"
#if __has_include(<mapkit_snapshotter_flutter_plus/mapkit_snapshotter_flutter_plus-Swift.h>)
#import <mapkit_snapshotter_flutter_plus/mapkit_snapshotter_flutter_plus-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mapkit_snapshotter_flutter_plus-Swift.h"
#endif

@implementation MapkitSnapshotterFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMapkitSnapshotterFlutterPlugin registerWithRegistrar:registrar];
}
@end
