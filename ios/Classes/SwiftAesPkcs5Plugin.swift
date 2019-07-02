import Flutter
import UIKit
import CryptoSwift

public class SwiftAesPkcs5Plugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "aes_pkcs5", binaryMessenger: registrar.messenger())
    let instance = SwiftAesPkcs5Plugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "encrypt":
        guard let args = call.arguments as? [String: String] else {
            fatalError("args are formatted badly")
        }
        let data = args["data"]!
        let key = args["key"]!
        let ivParameter = args["ivParameter"]!
        do{
            let aes = try! AES(key: key.bytes, blockMode: CBC(iv: ivParameter.bytes), padding: .pkcs5)
            result(try data.encryptToBase64(cipher: aes)!)
        } catch {
            result(FlutterMethodNotImplemented);
        }
    case "decrypt":
        guard let args = call.arguments as? [String: String] else {
            fatalError("args are formatted badly")
        }
        let data = args["data"]!
        let key = args["key"]!
        let ivParameter = args["ivParameter"]!
        do{
            let aes = try! AES(key: key.bytes, blockMode: CBC(iv: ivParameter.bytes), padding: .pkcs5)
            result(try data.decryptBase64ToString(cipher: aes))
        } catch {
            result(FlutterMethodNotImplemented);
        }
    case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
    default: result(FlutterMethodNotImplemented)
    }
  }
}
