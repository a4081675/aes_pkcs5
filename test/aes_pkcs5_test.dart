import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aes_pkcs5/aes_pkcs5.dart';

void main() {
  const MethodChannel channel = MethodChannel('aes_pkcs5');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AesPkcs5.platformVersion, '42');
  });
}
