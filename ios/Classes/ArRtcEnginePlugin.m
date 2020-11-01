#import "ArRtcEnginePlugin.h"
#if __has_include(<ar_rtc_engine/ar_rtc_engine-Swift.h>)
#import <ar_rtc_engine/ar_rtc_engine-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ar_rtc_engine-Swift.h"
#endif

@implementation ArRtcEnginePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftArRtcEnginePlugin registerWithRegistrar:registrar];
}
@end
