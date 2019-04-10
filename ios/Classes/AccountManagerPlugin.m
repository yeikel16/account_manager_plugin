#import "AccountManagerPlugin.h"
#import <account_manager_plugin/account_manager_plugin-Swift.h>

@implementation AccountManagerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAccountManagerPlugin registerWithRegistrar:registrar];
}
@end
