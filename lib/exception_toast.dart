import 'dart:async';

import 'package:flutter/services.dart';

class ExceptionToast {
  static const MethodChannel _channel =
      const MethodChannel('exception_toast');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
