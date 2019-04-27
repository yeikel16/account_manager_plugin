import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:account_manager_plugin/account_manager_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('account_manager_plugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
/*
  test('getPlatformVersion', () async {
    expect(await AccountManagerPlugin.platformVersion, '42');
  });*/
}
