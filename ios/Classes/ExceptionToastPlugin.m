#import "ExceptionToastPlugin.h"
#if __has_include(<exception_toast/exception_toast-Swift.h>)
#import <exception_toast/exception_toast-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "exception_toast-Swift.h"
#endif

@implementation ExceptionToastPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftExceptionToastPlugin registerWithRegistrar:registrar];
}
@end
