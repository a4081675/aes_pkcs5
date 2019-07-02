#import "AesPkcs5Plugin.h"
#import <aes_pkcs5/aes_pkcs5-Swift.h>

@implementation AesPkcs5Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAesPkcs5Plugin registerWithRegistrar:registrar];
}
@end
