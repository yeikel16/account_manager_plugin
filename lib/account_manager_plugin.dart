import 'dart:async';

import 'package:flutter/services.dart';

class AccountManagerPlugin {
  static const MethodChannel _channel =
      const MethodChannel('account_manager_plugin');

  /// Obtains all accounts registered in the user's device
  static Future<List<dynamic>> get getAccounts async {
    final List<dynamic> accounts =
        await _channel.invokeMethod('getAllAccounts');
    return accounts;
  }

  /// Obtains all mail accounts registered in the user's device
  static Future<List<dynamic>> get getMailsAccounts async {
    final List<dynamic> accounts =
        await _channel.invokeMethod('getMailsAccounts');
    return accounts;
  }
}
