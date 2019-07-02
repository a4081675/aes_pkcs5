import 'dart:async';

import 'package:flutter/services.dart';

class AesPkcs5 {
  static const MethodChannel _channel =
      const MethodChannel('aes_pkcs5');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<String> encrypt(String sSrc,String key,String ivParameter) async {
    String s;
    try {
      s = await _channel.invokeMethod("encrypt",{"data":sSrc,"key":key,"ivParameter":ivParameter});
    } on PlatformException catch (e) {
    }
    return s;
  }

  Future<String> decrypt(String sSrc,String key,String ivParameter) async {
    String s;
    try {
      s = await _channel.invokeMethod("decrypt",{"data":sSrc,"key":key,"ivParameter":ivParameter});
    } on PlatformException catch (e) {
      rethrow;
    }
    return s;
  }

}
