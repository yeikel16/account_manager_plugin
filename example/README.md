### Example

``` 
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:account_manager_plugin/account_manager_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();  
  String _currentAccounts = 'Anonymous';
  List<dynamic> accounts = List();
  Future<List<DropdownMenuItem<String>>> _dropDownMenuItems;

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = initDataState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<DropdownMenuItem<String>>>(
                future: _dropDownMenuItems,
                builder: (BuildContext context,
                    AsyncSnapshot<List<DropdownMenuItem<String>>> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        DropdownButton<String>(
                          value: _currentAccounts,
                          onChanged: changedDropDownItem,
                          items: snapshot.data,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Size Account: ${snapshot.data.length}"),
                        ),
                      ],
                    );
                  } else {
                    return DropdownButton<String>(
                      value: _currentAccounts,
                      onChanged: changedDropDownItem,
                      items: [
                        DropdownMenuItem(value: "mail", child: new Text('mail'))
                      ].toList(),
                    );
                  }
                }),
            Container(
              padding: EdgeInsets.all(16.0),
            ),
          ],
        )),
      ),
    );
  }

  Future<List<DropdownMenuItem<String>>> initDataState() async {
    try {
      accounts = await AccountManagerPlugin.getAccounts;
    } on PlatformException {}

    return getDropDownMenuItems(accounts);
  }

  Future<List<DropdownMenuItem<String>>> getDropDownMenuItems(
      List<dynamic> list) async {
    List<DropdownMenuItem<String>> items = new List();
    if (list.length > 0) {
      items.add(new DropdownMenuItem(
          value: 'Anonymous', child: new Text('Anonymous')));
      for (String mail in list.whereType<String>()) {
        debugPrint('ACCOUNT: $mail');
        items.add(new DropdownMenuItem(value: mail, child: new Text('$mail')));
      }
      items.forEach((f) => print('Value List: ${f.value}'));
    } else {
      items.add(new DropdownMenuItem(value: 'Vacio', child: new Text('Vacio')));
    }

    return items;
  }

  void changedDropDownItem(String selectedAccount) {
    setState(() {
      _currentAccounts = selectedAccount;
    });
    _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text('Account: $_currentAccounts select')));
  }
}

```
