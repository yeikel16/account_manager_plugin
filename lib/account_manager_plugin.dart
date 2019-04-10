import 'dart:async';

import 'package:flutter/services.dart';

class AccountManagerPlugin {
  static const MethodChannel _channel =
      const MethodChannel('account_manager_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
