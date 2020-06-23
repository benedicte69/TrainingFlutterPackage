import 'package:flutter/material.dart';
import 'package:flutter_package_training/flutter_package_training.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return IosAndroid.scaffold(
      string: "Test",
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IosAndroid.text(string: '${IosAndroid.isIOS()}', color: Colors.pink),
          RaisedButton(
            child: IosAndroid.text(
              string: 'press me',
            ),
            onPressed: () {
              IosAndroid.alert(context: context);
            },
          )
        ],
      )),
    );
  }
}
