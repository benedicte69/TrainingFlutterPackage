import 'package:flutter/material.dart';
import 'package:flutter_package_training/flutter_package_training.dart';

void main() {
  runApp(MyApp());
}

/// Set the widget which is the root of the application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// Make the app itself a widget
class MyHomePage extends StatefulWidget {
  ///Constructor
  MyHomePage({Key key, this.title}) : super(key: key);

  /// Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return IosAndroid.scaffold(
      string: 'Test',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IosAndroid.text(
                string: '${IosAndroid.isIOS()}', color: Colors.pink),
            IosAndroid.button(
                child: IosAndroid.text(string: 'error'),
                onPressed: () {
                  IosAndroid.alert(
                      context: context,
                      callback: () {
                        print('success');
                        Navigator.of(context).pop();
                      });
                })
          ],
        ),
      ),
    );
  }
}
