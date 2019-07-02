package com.xxm.aes_pkcs5

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class AesPkcs5Plugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "aes_pkcs5")
      channel.setMethodCallHandler(AesPkcs5Plugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "encrypt" -> {
        val data = call.argument<String>("data")
        val key = call.argument<String>("key")
        val ivParameter = call.argument<String>("ivParameter")
        result.success(AESUtils.getInstance().encrypt(data,key, ivParameter))
      }
      "decrypt" -> {
        val data = call.argument<String>("data")
        val key = call.argument<String>("key")
        val ivParameter = call.argument<String>("ivParameter")
        result.success(AESUtils.getInstance().decrypt(data,key, ivParameter))
      }
      "getPlatformVersion" -> {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      }
      else -> result.notImplemented()
    }
  }
}
