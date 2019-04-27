# account_manager_plugin

This plugin allows Flutter apps to obtain all accounts registered in the user's device.

## Usage
Support only for Android. 
Added permission in the Manifests:
``` 
<uses-permission
        android:name="android.permission.GET_ACCOUNTS"
        android:maxSdkVersion="22" />
``` 

If the plugin is invoked on iOS, it will crash your app. In checked mode, we assert that the platform should be Android.

Use it by specifying action:
``` 
if (platform.isAndroid) {
    try {
      List<dynamic> accounts = await AccountManagerPlugin.getAccounts;
    } on PlatformException {}
}
``` 

<p align="center"> <img src="https://github.com/Yeikel200/account_manager_plugin/blob/master/example/flutter_01.png" width="350"/> <img src="https://github.com/Yeikel200/account_manager_plugin/blob/master/example/flutter_02.png" width="350"/> </p>

### Getting Started
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
