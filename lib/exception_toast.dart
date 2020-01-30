import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ExceptionToast {
  static const MethodChannel _channel = const MethodChannel('exception_toast');

  /// Show Toast message to user for the provided [error] and `optional` [StackTrace] object
  static Future<bool> show({
    @required Object error,
    @required StackTrace trace,
  }) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'text': trace != null ? "Error: $error | ($trace)" : "Error: $error",
    };

    return await _channel.invokeMethod('exceptionToast', params);
  }
}
