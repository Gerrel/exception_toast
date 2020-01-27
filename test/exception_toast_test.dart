import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:exception_toast/exception_toast.dart';

void main() {
  const MethodChannel channel = MethodChannel('exception_toast');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return true;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('exceptionToast', () async {
    expect(await ExceptionToast.show(error: null, trace: null), true);
  });
}
