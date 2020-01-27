import Flutter
import UIKit

public class SwiftExceptionToastPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "exception_toast", binaryMessenger: registrar.messenger())
        let instance = SwiftExceptionToastPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        
        if "exceptionToast" == call.method {
            guard let args = call.arguments as? [String: Any] else {
                fprint("call.arguments is not of type [String: Any]")
                result(false)
                return
            }
            guard let text = args["text"] as? String else {
                fprint("call.arguments[\"text\"] is not of type String")
                result(false)
                return
            }
            guard let window = getWindow() else {
                fprint("window not found")
                result(false)
                return
            }
            window.showToast(text: text)
            result(true)
        } else {
            fprint("unknown call: \(call.method) | \(String(describing: call.arguments))")
        }
        result(false)
    }
    /// MARK: get key window
    
    private func getWindow() -> UIWindow? {
        for window in UIApplication.shared.windows {
            if window.isKeyWindow && window.windowLevel == .normal {
                return window
            }
        }
        return nil
    }
    
}
