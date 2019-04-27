import 'dart:async';

import 'package:flutter/services.dart';

class AccountManagerPlugin {
  static const MethodChannel _channel =
      const MethodChannel('account_manager_plugin');

  static Future<List<dynamic>> get getAccounts async {
    final List<dynamic> accounts = await _channel.invokeMethod('getAllAccounts');
    return accounts;
  }
  static Future<List<dynamic>> get getMailsAccounts async {
    final List<dynamic> accounts = await _channel.invokeMethod('getMailsAccounts');
    return accounts;
  }
}
